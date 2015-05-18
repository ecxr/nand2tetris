//  for (i=0; i<n; i++) {
// 	  arr[i] = -1
// }

// suppose that arr=100 and n=10

// arr=100
@100
D=A
@arr
M=D

// n=10
@10
D=A
@n
M=D

// initialize i = 0
@i
M=0

(LOOP)
  // if (i==n) goto END
  @i
  D=M
  @n
  D=D-M
  @END
  D;JEQ

  // RAM[arr+i] = -1
  @arr
  D=M
  @i
  // Set value of address register to the contents of the memory register
  A=D+M // D + M to A creates a pointer to the memory address
  M=-1  // write value to memory address

  // i++
  @i
  M=M+1

  @LOOP
  0;JMP

(END)
  @END
  0;JMP
