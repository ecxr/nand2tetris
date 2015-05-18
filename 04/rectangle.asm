// Rectangle.asm
// Draw a filled rectangle at the screen's top left corner.
// The rectangle's width is 16 pixels, and its height is RAM[0].
// Usage: put a non-negative number (rectangle's height) in RAM[0]

// for (i=0; i < n; i++) P
//		draw 16 black pixels at the beginning of row i
// }

//  addr = SCREEN
//  n = RAM[0]
//  i = 0
//
//  LOOP:
//  	if i > n goto END
//  	  RAM[addr] = -1 	// 111111111111111
//  	// advance to next row
//  	addr = addr + 32	// 32 words ina row (32 * 16 = 512)
//  	i = i + 1
//  	goto LOOP
//  END:
//  	goto END

@R0
D = M
@n
M = D			// n = RAM[0]

@i
M = 0			// i = 0

@SCREEN
D = A
@address
M = D			// address = 16384 (base address of the Hack screen)

(LOOP)
   @i
   D = M
   @n
   D = D - M
   @END
   D;JGT		// if i > n goto END

   @address
   A = M		// writing to memory using a pointer
   M = -1		// RAM[address] = -1 (16 pixels)
 
   @i
   M = M + 1	// i = i + 1
   @32
   D = A
   @address
   M = D + M	// address = address + 32
   @LOOP
   0;JMP		// goto LOOP

  (END)
     @END		// program's end
     0;JMP		// infinite loop