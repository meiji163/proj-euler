use std::fs;

fn alph_score(s: &String) -> u64 {
    let mut score: u64 = 0;
    for c in s.chars() {
        score += (c as u64) - 96;
    }
    score
}

fn main() {
    let contents = fs::read_to_string("p022_names.txt")
        .expect("error reading file");

    let mut names: Vec<String> = contents
        .split(",")
        .map(|s| s.trim_matches('"').to_lowercase())
        .collect();
    names.sort();

    let mut total: u64 = 0;
    for (i,n) in names.iter().enumerate() {
        let m = (i as u64) + 1;
        total +=  m * alph_score(&n);
    }
    println!("{}", total);
}
