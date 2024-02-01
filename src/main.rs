use compiler::compile;
use std::env;
use std::fs;

fn main() {
    let args: Vec<String> = env::args().collect();
    let code = fs::read_to_string(&args[1]).expect("Unable to read file");

    let output = compile(&code)
        .into_iter()
        .map(|(a, b, c, d)| format!("{:#010x} {:#010x} {:#010x} {:#010x}", a, b, c, d))
        .collect::<Vec<String>>()
        .join("\n");

    println!("{}", output);
}
