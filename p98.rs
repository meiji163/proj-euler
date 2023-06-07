use std::io;
use std::cmp;
use std::fs;
use std::collections::HashMap;

// Check if two strings are anagrams. Only works with A-Z chars
fn anagram_p(s1: &str, s2: &str) -> bool {
    if s1.len() != s2.len() {
        return false;
    }
    let mut cnt = [0i32; 26];
    for c in s1.chars() {
        let asc = c as u32;
        if asc < 65 || asc > 90 {
            return false;
        }
        cnt[(asc-65) as usize] += 1;
    }
    for c in s2.chars() {
        let asc = c as u32;
        if asc < 65 || asc > 90 {
            return false;
        }
        cnt[(asc-65) as usize] -= 1;
    }
    for c in cnt {
        if c != 0 {
            return false;
        }
    }
    true
}

fn square_p(n: u32) -> bool {
    let s = (n as f64).sqrt() as u32;
    s*s == n
}

fn num_to_digs(n: u32) -> Vec<u32> {
    let mut x = n;
    let mut out: Vec<u32> = Vec::new();

    loop {
        out.push(x % 10);
        x /= 10;
        if x == 0 {break}
    }
    out.reverse();
    out
}

// Match anagram strings with digits so they are both squares
fn match_anagram(w1: &str, w2: &str) -> Option<(u32,u32)>{
    let l = w1.len() as u32;
    let p = u32::pow(10, l-1) as f64;

    // squares with l digits
    let min = (p).sqrt().ceil() as u32;
    let max = (10_f64*p).sqrt().floor() as u32;
    let sqrs: Vec<u32> = (min..=max).map(|n| n*n).collect();

    let mut char_digit: HashMap<char,u32> = HashMap::new();
    'outer: for &sqr1 in sqrs.iter().rev() {
        char_digit.clear();
        for (c,d) in w1.chars()
                       .zip(num_to_digs(sqr1).into_iter()) {
            // continue if character or digit already assigned
            for (&c1,&d1) in &char_digit {
                if c1 == c || d == d1 {
                    continue 'outer;
                }
            }
            char_digit.insert(c,d);
        }

        // don't allow leading 0's
        let fst1 = w1.chars().nth(0).unwrap();
        let fst2 = w2.chars().nth(0).unwrap();
        if *char_digit.get(&fst1).unwrap() == 0 ||
            *char_digit.get(&fst2).unwrap() == 0 {
                continue;
            }

        let sqr2: u32 = w2
            .chars()
            .fold(0, |n, c| {
                10*n + char_digit.get(&c).unwrap()
            });

        if square_p(sqr2) {
            println!("MATCH: ({w1} {w2}) ({sqr1} {sqr2})");
            return Some((sqr1, sqr2));
        }
    }
    None
}

fn main() -> io::Result<()> {
    let words_str = fs::read_to_string("0098_words.txt")?;
    let words: Vec<&str> = words_str
        .split(',')
        .map(|w| w.trim_matches('"'))
        .collect();

    let mut anagrams = Vec::<(&str,&str)>::new();
    let l = words.len();
    for i in 1..l {
        for j in 0..i {
            if anagram_p(words[i], words[j]){
                anagrams.push( (words[i].clone(), words[j].clone()) );
            }
        }
    }

    // find maximum anagram square value
    let mut max_sqr: u32 = 0;
    for &(w1,w2) in anagrams.iter(){
        match match_anagram(w1, w2) {
            Some((s1,s2)) => max_sqr = cmp::max(max_sqr, cmp::max(s1,s2)),
            _ => (),
        }
    }
    println!("MAXIMUM: {max_sqr}");

    Ok(())
}
