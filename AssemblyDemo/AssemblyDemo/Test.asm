
.586              ;Target processor.  Use instructions for Pentium class machines
.MODEL FLAT, C    ;Use the flat memory model. Use C calling conventions
.STACK 4096       ;Define a stack segment of 1KB (Not required for this example)
.DATA             ;Create a near data segment.  Local variables are declared after
                  ;this directive (Not required for this example)
.CODE             ;Indicates the start of a code segment.


division PROC

    ; edx will store the remainder

    mov eax, 9
    mov ebx, 2
    div ebx

division ENDP

multiplyOverflow PROC

    ; on the topic of overflow when using multiplication: if you
    ; do a multiply, the max number of overflow digits you can have
    ; can not exceed the number you started with
    ;   1 1 1 1
    ;   1 1 1 1
    ;   -------
    ;  11111111  <-- four overflow bits
    ;
    ; to solve overflow issues, the intel architecture will use the
    ; edx register for overflow bits; edx will store the overflow in edx
    ; | edx | eax | <-- registers
    ;
    ; edx == 'd' stands for data

    ; hex in assembly needs to start with '0' and end with 'h'
    mov eax, 0FFFFFFFFh
    mov ebx, 0FFFFFFFFh
    mul ebx;

    ret

multiplyOverflow ENDP
doit PROC
    
    ; 8 + 4 - 2 + 3

    mov eax, 8
    add eax, 4   ; reads value in eax and adds it value in ebx, and stores it in ebx
    sub eax, 2
    add eax, 3

    ; numbers, such as above, when used directly are called 'immediate values'

    mov eax, 8
    mov ebx, 4

    ; mul always assume eax as the first argument
    ; that's why we call it the accumulator register
    ; prefer mul ebx,  over mul eax, ebx
    mul ebx

    ret
doit ENDP 
END 