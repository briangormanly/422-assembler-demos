section .data
instruct db	'Please enter two signed 16-bit integers', 10, 0
instr1   db     'Enter an integer: ',0
mystring db	10, 'X = %d', 10, 0
instring db     '%d',0

section .bss
X	resw	1
in1	resd	1
in2	resd	1
section .text
    global _start                       ;must be declared for linker (ld)

_start:  
                               ;tell linker entry point
extern	printf
extern  scanf
;; put your code here

getinput:
	push	instruct
	call	printf
	add	esp, 4

	push	instr1
	call	printf
	add	esp, 4

	push	in1
	push	instring
	call	scanf
	add	esp, 8

getinput2:
	push	instr1
	call	printf
	add	esp,4
	push	in2
	push	instring
	call	scanf
	add	esp, 8

	mov	eax, [in1]
	mov	ebx, [in2]

chkinput:
        cmp 	ax, bx  	
	jge 	notLess         ; use a jump with the opposite condition
	jmp 	axLess          ; now do a long jump 
notLess:
  	mov 	word [X], 1     ; This is the 'else part 
	jmp 	Both            ; skip the 'then' part 
axLess:
  	mov 	word [X], -1    ; This is the 'then' part 
Both:  			        ; Everyone back together here 

	mov	ax, [X]
	cwde			; Since we are printing using %d, we need to convert X
				; to 32 bits.
	
	;push	eax
	push	mystring
	call	printf
	add	esp, 8

;; The final part of the program must be a call to the operating system to exit
;;; the program.
        mov     ebx,0   ;successful termination of program
        mov     eax,1   ;system call number (sys_exit)
        int     0x80    ;call kernel

