// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(MAIN_LOOP)
	// reset screen address
	@SCREEN
	D = A
	@address
	M = D			// address = 16384 (base address of the Hack screen)

	@i				// i = 0
	M = 0
	@8192
	D = A           // i = 0 to 8191 (pixels)
	@screen_buffer_end
	M = D

	@color			
	M = 0			// default color to white
	@KBD
	D = M			// read contents of keyboard
	@FILL_SCREEN
	D;JEQ			// if no key pressed, fill screen with white

	// key is pressed, fill screen with black
	@color
	M = -1

	// Fill screen with specified color
	// pixels are at address 0 to 4096
	// (for i = 0; i < 4096; i++) {
	//     SCREEN[i] = color;
	// }

	(FILL_SCREEN)
		// if (i == screen_buffer_end) GOTO MAIN_LOOP
	  	@i
  		D = M
 	 	@screen_buffer_end
	  	D = D - M
	  	@MAIN_LOOP
  		D;JEQ

	  	// Write color to current address on screen
  		// address[i] = color
  		@color
  		D = M
	    @address
	    A = M		// writing to memory using a pointer:
	    M = D		// RAM[address] = color (16 pixels)
 
	    @i
	    M = M + 1	// i = i + 1
	    @address
	    M = M + 1	// address = address + 1
		@FILL_SCREEN 	
		0;JMP		// repeat