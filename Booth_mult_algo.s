.data
    multiplier: .word 0xffffff55
    multiplicand: .word 0x55
    product: .word 0,0

.text
.global _start

_start:
    ldr r3,= multiplier
    ldr r3,[r3]
    ldr r2,= multiplicand
    ldr r2,[r2]

@changing msb of V if lsb of u is 1
    mov r7,#0x80000000
@last bit 1 or not
    mov r4,#1

@Booth
    mov r0,r3 		@ V
    mov r1,#0 		@ U
    mov r6,#0		@ prev bit
    mov r8,#0 	    @ to cover 32 bits

loop:
    cmp r8, #32
    beq finish
    add r8,r8,#1

@to check last bit of V
    and r5,r4,r0
										
@current/prev bit
    cmp r5,r6
    beq shifting

    cmp r5,r6
    bgt subcomp

@1 to 0
    add r1,r1,r2
    b shifting

subcomp:
    sub r1,r1,r2

shifting:
    and r9,r4,r1    @check last bit of U 1 or not
    mov r0,r0,LSR #1
    cmp r9,#1
    bne skip_orr

orr r0,r0,r7	@if lsb of U=1 then OR with V

skip_orr:
    mov r6,r5
    mov r1,r1,ASR #1

b loop		@continue

finish:
    ldr r10,=product
    str r1,[r10]
    str r0,[r10,#4]
