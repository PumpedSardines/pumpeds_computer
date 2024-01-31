use std::collections::HashMap;

enum Op {
    Mov,
    Add,
    Sub,
    And,
    Or,
    Nand,
    Nor,
    Xor,
    Shl,
    Shr,
    Not,
    Neg,
}

#[derive(PartialEq, Eq)]
enum ValType {
    Reg,
    Immediate,
    Label,
}

pub struct Instruction {
    op: Op,
    vals: Vec<String>,
}

impl Instruction {
    fn op(op: &String) -> Option<Op> {
        match op.as_ref() {
            "mov" => Some(Op::Mov),
            "add" => Some(Op::Add),
            "sub" => Some(Op::Sub),
            "and" => Some(Op::And),
            "or" => Some(Op::Or),
            "nand" => Some(Op::Nand),
            "nor" => Some(Op::Nor),
            "xor" => Some(Op::Xor),
            "shl" => Some(Op::Shl),
            "shr" => Some(Op::Shr),
            "not" => Some(Op::Not),
            "neg" => Some(Op::Neg),
            _ => None,
        }
    }

    fn op_len(op: &Op) -> usize {
        match op {
            Op::Mov => 3,
            Op::Add => 4,
            Op::Sub => 4,
            Op::And => 4,
            Op::Or => 4,
            Op::Nand => 4,
            Op::Nor => 4,
            Op::Xor => 4,
            Op::Shl => 4,
            Op::Shr => 4,
            Op::Not => 3,
            Op::Neg => 3,
        }
    }

    pub fn from_line(line: &String) -> Result<Option<Self>, Box<dyn std::error::Error>> {
        let parts = line.split_whitespace().collect::<Vec<&str>>();

        if parts.len() == 0 {
            return Ok(None);
        }

        let op = Self::op(&parts[0].to_string()).ok_or("Unknown instruction")?;
        let len = Self::op_len(&op);

        if parts.len() != len {
            return Err("Wrong number of arguments".into());
        }

        let vals = parts[1..]
            .iter()
            .map(|s| s.to_string())
            .collect::<Vec<String>>();

        Ok(Some(Self { op, vals }))
    }

    fn parse_val(val: &String, label_set: &HashMap<String, u32>) -> Option<(u32, ValType)> {
        if val.starts_with("r") {
            let reg = val[1..].parse::<u32>().ok()?;
            return Some((reg, ValType::Reg));
        }

        if val.starts_with("0x") {
            let imm = u32::from_str_radix(&val[2..], 16).ok()?;
            return Some((imm, ValType::Immediate));
        }

        if let Ok(v) = val.parse::<u32>() {
            return Some((v, ValType::Immediate));
        } else {
            if !label_set.contains_key(val) {
                return None;
            }

            return Some((*label_set.get(val).unwrap(), ValType::Label));
        }
    }

    pub fn to_byte_code(
        &self,
        label_set: &HashMap<String, u32>,
    ) -> Result<(u32, u32, u32, u32), Box<dyn std::error::Error>> {
        const ALU: u32 = 0b0000 << 24;
        const FALU: u32 = 0b0001 << 24;

        const ADD: u32 = 0x00;
        const SUB: u32 = 0x01;
        const AND: u32 = 0x02;
        const OR: u32 = 0x03;
        const NAND: u32 = 0x04;
        const NOR: u32 = 0x05;
        const XOR: u32 = 0x06;
        const SHL: u32 = 0x07;
        const SHR: u32 = 0x08;
        const NOT: u32 = 0x09;
        const NEG: u32 = 0x0A;

        const ADDR1_CONST: u32 = 0b0001 << 28;
        const ADDR2_CONST: u32 = 0b0010 << 28;

        match self.op {
            Op::Mov => {
                let (src, src_t) =
                    Self::parse_val(&self.vals[0], label_set).ok_or("Invalid src")?;
                let (dst, dst_t) =
                    Self::parse_val(&self.vals[1], label_set).ok_or("Invalid dst")?;

                let mut op_byte = ALU | ADDR1_CONST | ADD;

                if dst_t != ValType::Reg {
                    return Err("Invalid dst".into());
                }

                if src_t != ValType::Reg {
                    op_byte |= ADDR2_CONST;
                }

                return Ok((op_byte, 0, src, dst));
            }
            Op::Not | Op::Neg => {
                let (src, src_t) =
                    Self::parse_val(&self.vals[0], label_set).ok_or("Invalid src")?;
                let (dst, dst_t) =
                    Self::parse_val(&self.vals[1], label_set).ok_or("Invalid dst")?;

                let mut op_byte = ALU | ADDR2_CONST;

                op_byte = match self.op {
                    Op::Not => op_byte | NOT,
                    Op::Neg => op_byte | NEG,
                    _ => unreachable!(),
                };

                if dst_t != ValType::Reg {
                    return Err("Invalid dst".into());
                }

                if src_t != ValType::Reg {
                    op_byte |= ADDR1_CONST;
                }

                return Ok((op_byte, src, 0, dst));
            }
            Op::Add
            | Op::Sub
            | Op::And
            | Op::Or
            | Op::Nand
            | Op::Nor
            | Op::Xor
            | Op::Shl
            | Op::Shr => {
                let (src_1, src_1_t) =
                    Self::parse_val(&self.vals[0], label_set).ok_or("Invalid src")?;
                let (src_2, src_2_t) =
                    Self::parse_val(&self.vals[1], label_set).ok_or("Invalid src")?;
                let (dst, dst_t) =
                    Self::parse_val(&self.vals[2], label_set).ok_or("Invalid dst")?;

                let mut op_byte = ALU;

                op_byte = match self.op {
                    Op::Add => op_byte | ADD,
                    Op::Sub => op_byte | SUB,
                    Op::And => op_byte | AND,
                    Op::Or => op_byte | OR,
                    Op::Nand => op_byte | NAND,
                    Op::Nor => op_byte | NOR,
                    Op::Xor => op_byte | XOR,
                    Op::Shl => op_byte | SHL,
                    Op::Shr => op_byte | SHR,
                    _ => unreachable!(),
                };

                if src_1_t != ValType::Reg {
                    op_byte |= ADDR1_CONST;
                }
                if src_2_t != ValType::Reg {
                    op_byte |= ADDR2_CONST;
                }

                if dst_t != ValType::Reg {
                    return Err("Invalid dst".into());
                }

                return Ok((op_byte, src_1, src_2, dst));
            }
        }
    }
}
