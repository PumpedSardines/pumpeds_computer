use regex::Regex;
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
    Eq,
    Ne,
    ULt,
    ULte,
    UGt,
    UGte,
    ILt,
    ILte,
    IGt,
    IGte,
    JumpAlways,
    JumpIfTrue,
    JumpIfFalse,
    RamSave,
    RamLoad,
    Halt,
    Push,
    Pop,
    Call,
    Ret,
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
            "eq" => Some(Op::Eq),
            "ne" => Some(Op::Ne),
            "u_lt" => Some(Op::ULt),
            "u_lte" => Some(Op::ULte),
            "u_gt" => Some(Op::UGt),
            "u_gte" => Some(Op::UGte),
            "i_lt" => Some(Op::ILt),
            "i_lte" => Some(Op::ILte),
            "i_gt" => Some(Op::IGt),
            "i_gte" => Some(Op::IGte),
            "jmp" => Some(Op::JumpAlways),
            "jt" => Some(Op::JumpIfTrue),
            "jf" => Some(Op::JumpIfFalse),
            "sram" => Some(Op::RamSave),
            "lram" => Some(Op::RamLoad),
            "halt" => Some(Op::Halt),
            "push" => Some(Op::Push),
            "pop" => Some(Op::Pop),
            "call" => Some(Op::Call),
            "ret" => Some(Op::Ret),
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
            Op::Eq => 4,
            Op::Ne => 4,
            Op::ULt => 4,
            Op::ULte => 4,
            Op::UGt => 4,
            Op::UGte => 4,
            Op::ILt => 4,
            Op::ILte => 4,
            Op::IGt => 4,
            Op::IGte => 4,
            Op::JumpAlways => 2,
            Op::JumpIfTrue => 3,
            Op::JumpIfFalse => 3,
            Op::RamSave => 3,
            Op::RamLoad => 3,
            Op::Halt => 2,
            Op::Push => 2,
            Op::Pop => 2,
            Op::Call => 2,
            Op::Ret => 1,
        }
    }

    pub fn from_line(line: &String) -> Result<Option<Self>, Box<dyn std::error::Error>> {
        let parts = line.split_whitespace().collect::<Vec<&str>>();

        if parts.len() == 0 {
            return Ok(None);
        }

        let op =
            Self::op(&parts[0].to_string()).ok_or(format!("Unknown instruction: {}", parts[0]))?;
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
        if val == &String::from("clock") {
            return Some((14, ValType::Reg));
        }

        if val == &String::from("input") || val == &String::from("output") {
            return Some((13, ValType::Reg));
        }

        if val.starts_with("r") {
            let reg = val[1..].parse::<u32>().ok()?;
            return Some((reg, ValType::Reg));
        }

        if val.starts_with("-") {
            let imm = val.parse::<i32>().ok()?;
            return Some((imm as u32, ValType::Immediate));
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
        const COND: u32 = 0b0010 << 24;
        const JUMP: u32 = 0b0011 << 24;
        const RAM_SAVE: u32 = 0b0100 << 24;
        const RAM_LOAD: u32 = 0b0101 << 24;
        const HALT: u32 = 0b0110 << 24;
        const STACK_PUSH: u32 = 0b0111 << 24;
        const STACK_POP: u32 = 0b1000 << 24;
        const CALL: u32 = 0b1001 << 24;
        const RET: u32 = 0b1010 << 24;

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

        const EQ: u32 = 0x00;
        const NE: u32 = 0x01;
        const U_LT: u32 = 0x02;
        const U_LTE: u32 = 0x03;
        const U_GT: u32 = 0x04;
        const U_GTE: u32 = 0x05;
        const I_LT: u32 = 0x06;
        const I_LTE: u32 = 0x07;
        const I_GT: u32 = 0x08;
        const I_GTE: u32 = 0x09;

        const JUMP_IF_TRUE: u32 = 0x00;
        const JUMP_IF_FALSE: u32 = 0x01;

        const HALT_OK: u32 = 0x00;
        const HALT_ERR: u32 = 0x01;

        const ADDR1_CONST: u32 = 0b0001 << 28;
        const ADDR2_CONST: u32 = 0b0010 << 28;

        const INPUT_OUTPUT_REG: u32 = 13;
        const CLOCK_REG: u32 = 14;

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
            Op::Ret => {
                let op_byte = RET;

                return Ok((op_byte, 0, 0, CLOCK_REG));
            }
            Op::Call => {
                let (dst, dst_t) =
                    Self::parse_val(&self.vals[0], label_set).ok_or("Invalid dst")?;

                let mut op_byte = CALL;

                if dst_t != ValType::Reg {
                    op_byte |= ADDR2_CONST;
                }

                return Ok((op_byte, CLOCK_REG, dst, 0));
            }
            Op::Push => {
                let (src, src_t) =
                    Self::parse_val(&self.vals[0], label_set).ok_or("Invalid src")?;

                let mut op_byte = STACK_PUSH;

                if src_t != ValType::Reg {
                    op_byte |= ADDR1_CONST;
                }

                return Ok((op_byte, src, 0, 0));
            }
            Op::Pop => {
                let (dst, dst_t) =
                    Self::parse_val(&self.vals[0], label_set).ok_or("Invalid dst")?;

                let op_byte = STACK_POP;

                if dst_t != ValType::Reg {
                    return Err("Invalid dst".into());
                }

                return Ok((op_byte, 0, 0, dst));
            }
            Op::RamLoad => {
                let (src, src_t) =
                    Self::parse_val(&self.vals[0], label_set).ok_or("Invalid src")?;
                let (dst, dst_t) =
                    Self::parse_val(&self.vals[1], label_set).ok_or("Invalid src")?;

                let mut op_byte = RAM_LOAD;

                if src_t != ValType::Reg {
                    op_byte |= ADDR1_CONST;
                }
                if dst_t != ValType::Reg {
                    return Err("Invalid dst".into());
                }

                return Ok((op_byte, src, 0, dst));
            }
            Op::Halt => {
                let mut op_byte = HALT;

                match self.vals[0] {
                    ref s if s == "ok" => op_byte |= HALT_OK,
                    ref s if s == "err" => op_byte |= HALT_ERR,
                    _ => return Err("Invalid halt type".into()),
                }

                return Ok((op_byte, 0, 0, 0));
            }
            Op::RamSave => {
                let (src_1, src_1_t) =
                    Self::parse_val(&self.vals[0], label_set).ok_or("Invalid src")?;
                let (src_2, src_2_t) =
                    Self::parse_val(&self.vals[1], label_set).ok_or("Invalid src")?;

                let mut op_byte = RAM_SAVE;

                if src_1_t != ValType::Reg {
                    op_byte |= ADDR1_CONST;
                }
                if src_2_t != ValType::Reg {
                    op_byte |= ADDR2_CONST;
                }

                return Ok((op_byte, src_1, src_2, 0));
            }
            Op::Not | Op::Neg => {
                let (src, src_t) =
                    Self::parse_val(&self.vals[0], label_set).ok_or("Invalid src")?;
                let (dst, dst_t) =
                    Self::parse_val(&self.vals[1], label_set).ok_or("Invalid dst")?;

                let mut op_byte = ALU | ADDR1_CONST;

                op_byte = match self.op {
                    Op::Not => op_byte | NOT,
                    Op::Neg => op_byte | NEG,
                    _ => unreachable!(),
                };

                if dst_t != ValType::Reg {
                    return Err("Invalid dst".into());
                }

                if src_t != ValType::Reg {
                    op_byte |= ADDR2_CONST;
                }

                return Ok((op_byte, 0, src, dst));
            }
            Op::JumpAlways => {
                let (dst, dst_t) =
                    Self::parse_val(&self.vals[0], label_set).ok_or("Invalid dst")?;

                let mut op_byte = JUMP | JUMP_IF_TRUE | ADDR1_CONST;

                if dst_t != ValType::Reg {
                    op_byte |= ADDR2_CONST;
                }

                return Ok((op_byte, 1, dst, 0));
            }
            Op::JumpIfTrue | Op::JumpIfFalse => {
                let (src, src_t) =
                    Self::parse_val(&self.vals[0], label_set).ok_or("Invalid src")?;
                let (dst, dst_t) =
                    Self::parse_val(&self.vals[1], label_set).ok_or("Invalid dst")?;

                let mut op_byte = JUMP | ADDR2_CONST;

                op_byte = match self.op {
                    Op::JumpIfTrue => op_byte | JUMP_IF_TRUE,
                    Op::JumpIfFalse => op_byte | JUMP_IF_FALSE,
                    _ => unreachable!(),
                };

                if src_t != ValType::Reg {
                    op_byte |= ADDR1_CONST;
                }

                if dst_t != ValType::Reg {
                    op_byte |= ADDR2_CONST;
                }

                return Ok((op_byte, src, dst, 0));
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

            Op::Eq
            | Op::Ne
            | Op::ULt
            | Op::ULte
            | Op::UGt
            | Op::UGte
            | Op::ILt
            | Op::ILte
            | Op::IGt
            | Op::IGte => {
                let (src_1, src_1_t) =
                    Self::parse_val(&self.vals[0], label_set).ok_or("Invalid src")?;
                let (src_2, src_2_t) =
                    Self::parse_val(&self.vals[1], label_set).ok_or("Invalid src")?;
                let (dst, dst_t) =
                    Self::parse_val(&self.vals[2], label_set).ok_or("Invalid dst")?;

                let mut op_byte = COND;

                op_byte = match self.op {
                    Op::Eq => op_byte | EQ,
                    Op::Ne => op_byte | NE,
                    Op::ULt => op_byte | U_LT,
                    Op::ULte => op_byte | U_LTE,
                    Op::UGt => op_byte | U_GT,
                    Op::UGte => op_byte | U_GTE,
                    Op::ILt => op_byte | I_LT,
                    Op::ILte => op_byte | I_LTE,
                    Op::IGt => op_byte | I_GT,
                    Op::IGte => op_byte | I_GTE,
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

enum CodeType {
    Instruction(Instruction),
    Label(String),
}

fn parse_code(code: &String) -> Vec<CodeType> {
    let mut instructions: Vec<CodeType> = Vec::new();
    let re = Regex::new(r";.+$").unwrap();

    for line in code.lines() {
        let line = re.replace(line, "");
        let line = line.trim();
        let mut parts = line.split_whitespace();
        let instruction = parts.next();

        if instruction.is_none() {
            continue;
        }

        let instruction = instruction.unwrap();

        if instruction.ends_with(":") {
            instructions.push(CodeType::Label(
                instruction[..instruction.len() - 1].to_string(),
            ));
            continue;
        }

        Instruction::from_line(&line.to_string())
            .unwrap()
            .map(|i| instructions.push(CodeType::Instruction(i)));
    }

    instructions
}

fn assemble(instructions: Vec<CodeType>) -> Vec<(u32, u32, u32, u32)> {
    let mut labels: HashMap<String, u32> = HashMap::new();
    let mut bytes = vec![];

    let mut i = 0;
    for instruction in &instructions {
        match instruction {
            CodeType::Instruction(_) => {
                i += 1;
            }
            CodeType::Label(l) => {
                labels.insert(l.to_string(), (i as u32) * 4);
            }
        }
    }

    for instruction in instructions {
        match instruction {
            CodeType::Instruction(i) => {
                let data = i.to_byte_code(&labels).unwrap();

                bytes.push(data);
            }
            CodeType::Label(_) => { /* Do nothing */ }
        }
    }

    bytes
}

pub fn compile(code: &String) -> Vec<(u32, u32, u32, u32)> {
    assemble(parse_code(code))
}
