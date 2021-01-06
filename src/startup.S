.section .init
.globl _start
_start:

ldr r0,=0x20200000

# The status LED is attached to GPIO 47 on
# the Raspberry Pi Zero W so we need to enable
# the 7th pin in the 5th GPIO bank
mov r1,#1
lsl r1,#21        @ 21=7*3 -> enable 7th pin
str r1,[r0,#16]   @ 16=4*4 -> select 5th GPIO bank

mov r1,#1
lsl r1,#15        @ 15=47-32 -> pin 47 = 15th bit in 2nd byte
str r1,[r0,#44]

main_loop$:
b main_loop$

