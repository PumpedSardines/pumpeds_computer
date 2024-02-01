use compiler::compile;
use std::env;
use std::fs;

fn main() {
    let args: Vec<String> = env::args().collect();
    let code = fs::read_to_string(&args[1]).expect("Unable to read file");

    let type_of_operation = if args.len() == 3 {
        args[2].clone()
    } else {
        "compile".to_string()
    };

    match type_of_operation.as_str() {
        "compile" => compile_and_print(&code),
        "size" => size_and_print(&code),
        _ => panic!("Unknown operation"),
    }
}

fn size_and_print(code: &String) {
    let instructions_len = compile(code).len();
    let kb = (((instructions_len * 4) as f32) / 10.0).round() / 100.0;
    let bytes = instructions_len * 4;
    let bits = bytes * 8;

    println!("{} instructions", instructions_len);
    println!("{} bytes", bytes);
    println!("{} bits", bits);
    println!("{} KB", kb);
}

fn compile_and_print(code: &String) {
    let output = compile(code)
        .into_iter()
        .map(|(a, b, c, d)| format!("{:#010x} {:#010x} {:#010x} {:#010x}", a, b, c, d))
        .collect::<Vec<String>>()
        .join("\n");

    println!("{}", output);
}
