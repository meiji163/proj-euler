use std::io;
use std::fs;
use std::str;

const EN_WORDS : &[&str] = &[
    "the", "then", "of", "and", "that", "have",
    "I", "it", "for", "not", "with", "as", "this",
    "but", "his", "from", "they", "we", "her",
    "there", "their", "what", "which",
];

fn xor_bytes(bs: &[u8], key: &[u8]) -> Vec<u8> {
    bs.iter().cloned()
        .zip(key.iter().cycle())
        .map(|(b, k)| b^k)
        .collect()
}

fn score(bs: &[u8]) -> i32 {
    let asc_str = match str::from_utf8(bs) {
        Ok(s) => s,
        Err(_) => return 0,
    };
    EN_WORDS.iter()
            .map(|w| if asc_str.contains(w) {w.len() as i32} else {0})
            .sum()
}

fn main() -> io::Result<()> {
    let inp_str = fs::read_to_string("0059_cipher.txt")?;
    let enc_bytes : Vec<u8> = inp_str
        .split(',')
        .map(|s| s.parse::<u8>().unwrap())
        .collect();

    let mut keys = Vec::new();
    for c0 in 97..123 {
        for c1 in 97..123 {
            for c2 in 97..123 {
               let k : [u8; 3] = [c0, c1, c2];
               keys.push(k);
            }
        }
    }

    let scores : Vec<i32> = keys.iter()
        .map(|k| score(&xor_bytes(&enc_bytes, k)))
        .collect();

    // find max score decoded text
    let max_score = scores.iter().max().unwrap();
    let max_idx = scores.iter().position(|x| x == max_score).unwrap();
    let dec_bytes = xor_bytes(&enc_bytes, &keys[max_idx]);
    let dec_str = str::from_utf8(&dec_bytes).unwrap();
    println!("{dec_str}");

    let ans : u32 = dec_bytes.iter()
        .map(|b| *b as u32)
        .sum();
    println!("{ans}");

    Ok(())
} 

