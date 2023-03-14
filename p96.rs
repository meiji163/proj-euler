use std::io::{self, BufReader};
use std::io::prelude::*;
use std::fs::File;

type Board = [[u8; 9]; 9];

fn prn_board(bd: &Board){
    for i in 0..9 {
        for j in 0..9 {
            print!("{} ", bd[i][j]);
        }
        print!("\n");
    }
    print!("\n");
}

fn load_board(bd: &mut Board, s: &String) {
    let it = s.chars().map(|c| c.to_digit(10).unwrap());
    for (n,d) in it.enumerate() {
        let (i, j) = (n/9, n%9); 
        bd[i][j] = d as u8;
    }
}


fn safep(bd: &Board, i: usize, j:usize, k: u8) -> bool {
    for m in 0..9 {
        if bd[i][m] == k || bd[m][j] == k {
            return false;
        }
    }
    let bi = (i/3) * 3;
    let bj = (j/3) * 3;
    for m in 0..3 {
        for n in 0..3 {
            if bd[ bi+m ][ bj+n ] == k {
                return false;
            }
        }
    }
    true
}

fn solve_board(bd: &mut Board) -> bool {
    for i in 0..9 {
        for j in 0..9 {
            if bd[i][j] == 0 {
                for k in 1..=9 {
                    if safep(bd, i, j, k) {
                        bd[i][j] = k;
                        if solve_board(bd) {
                            //prn_board(bd);
                            return true;
                        }
                        bd[i][j] = 0;
                    }
                }
                return false;
            }
        }
    }
    true
}

fn main() -> io::Result<()> {
    let f = File::open("p096_sudoku.txt")?;
    let f = BufReader::new(f);

    let mut board = [[0u8; 9]; 9];
    let mut board_strs = Vec::<String>::new();

    // read board strings
    let it = f.lines()
            .map(|l| l.unwrap())
            .filter(|l| !l.starts_with("Grid"));

    let mut s = String::new();
    for (i,l) in it.enumerate() { 
        s.push_str(&l);
        if i%9 == 8 {
            assert_eq!(s.len(), 81);
            board_strs.push(s.clone());
            s = String::new();
        }
    }

    let mut acc = 0;
    for bstr in board_strs.iter() {
        load_board(&mut board, &bstr);
        solve_board(&mut board);
        //prn_board(&board);
        acc += 100*(board[0][0] as i32)
            + 10*(board[0][1] as i32) 
            + board[0][2] as i32;
    }
    println!("{}", acc);

    Ok(())
}
