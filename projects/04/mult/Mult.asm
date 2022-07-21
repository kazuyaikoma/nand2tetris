// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

@sum  // 変数宣言
// e.g. sumのアドレスが1212
M=0   // sum = 0
// e.g. M[1212] = 0

// R0
@0    // 定数宣言
D=M   // データレジスタに0を代入(D=Memory[0])
@i    // 変数宣言
M=D   // i = Memory[0]

(LOOP)
  @i
  D=M // D=M[i] => D=i
  @END
  D;JEQ

// R1
  @1
  D=M // D=M[1]
  @sum
  M=D+M // sum=sum+i
  @i
  M=M-1 // i=i-1
  @LOOP
  0;JMP // LOOPへ移動
(END)

@sum
D=M

// R2
@2
M=D // R2 = @sum
@END
0;JMP
