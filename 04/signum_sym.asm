// Program: signum.asm
// Computes: If R0 > 0
//				R1 = 1
//			 else
//				R1 = 0

@R0
D = M			// D = RAM[0]

@POSITIVE
D; JGT			// if R0 > 0 goto 8

@R1
M = 0			// RAM[1] = 0
@END
0; JMP			// Jump to end of program

(POSITIVE)
@R1
M = 1			// R1 = 1

(END)
@10
0; JMP			// end of program