@R0			// A = 0
D = M		// D = RAM[0]

@R1			// A = 1
D = D + M	// D = D + RAM[1]

@R2			// A = 2
M = D		// RAM[2] = D

@6			// Infinite loop to terminate program
0;JMP		
