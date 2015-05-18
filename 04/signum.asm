// Program: signum.asm
// Computes: If R0 > 0
//				R1 = 1
//			 else
//				R1 = 0

@R0
D = M			// D = RAM[0]

@8
D; JGT			// if R0 > 0 goto 8

@R1
M = 0			// RAM[1] = 0
@10
0; JMP			// end of program

@R1
M = 1			// R1 = 1

@10
0; JMP			// end of program