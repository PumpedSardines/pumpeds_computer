use compiler::Instruction;
use regex::Regex;
use std::collections::HashMap;

const example: &'static str = include_str!("example.asm");

enum CodeType {
    Instruction(Instruction),
    Label(String),
}

fn parse_code(code: String) -> Vec<CodeType> {
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

fn main() {
    let outp = assemble(parse_code(example.to_string()))
        .into_iter()
        .map(|(a, b, c, d)| format!("{:#010x} {:#010x} {:#010x} {:#010x}", a, b, c, d))
        .collect::<Vec<String>>()
        .join("\n");

    println!("{}", outp);
}
