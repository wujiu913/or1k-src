#objdump: -dr --prefix-addresses --show-raw-insn
#name: MIPS hilo-diff o32/EB
#as: -32 -EB
#source: hilo-diff.s

.*: +file format .*mips.*

Disassembly of section \.text:
[0-9a-f]+ <[^>]*> 3080 0000 	li	a0,0
[0-9a-f]+ <[^>]*> 0084 8000 	sll	a0,a0,0x10
[0-9a-f]+ <[^>]*> 3084 7ffc 	addiu	a0,a0,32764
[0-9a-f]+ <[^>]*> 30a0 0000 	li	a1,0
[0-9a-f]+ <[^>]*> 00a5 8000 	sll	a1,a1,0x10
[0-9a-f]+ <[^>]*> 30a5 8000 	addiu	a1,a1,-32768
[0-9a-f]+ <[^>]*> 3080 0000 	li	a0,0
[0-9a-f]+ <[^>]*> 0084 8000 	sll	a0,a0,0x10
[0-9a-f]+ <[^>]*> 3084 7ffc 	addiu	a0,a0,32764
[0-9a-f]+ <[^>]*> 30a0 0000 	li	a1,0
[0-9a-f]+ <[^>]*> 00a5 8000 	sll	a1,a1,0x10
[0-9a-f]+ <[^>]*> 30a5 8000 	addiu	a1,a1,-32768
	\.\.\.
[0-9a-f]+ <[^>]*> 3080 0000 	li	a0,0
[0-9a-f]+ <[^>]*> 0084 8000 	sll	a0,a0,0x10
[0-9a-f]+ <[^>]*> 3084 7ffc 	addiu	a0,a0,32764
[0-9a-f]+ <[^>]*> 30a0 0000 	li	a1,0
[0-9a-f]+ <[^>]*> 00a5 8000 	sll	a1,a1,0x10
[0-9a-f]+ <[^>]*> 30a5 8000 	addiu	a1,a1,-32768
[0-9a-f]+ <[^>]*> 3080 0001 	li	a0,1
[0-9a-f]+ <[^>]*> 0084 8000 	sll	a0,a0,0x10
[0-9a-f]+ <[^>]*> 3084 8000 	addiu	a0,a0,-32768
[0-9a-f]+ <[^>]*> 30a0 ffff 	li	a1,-1
[0-9a-f]+ <[^>]*> 00a5 8000 	sll	a1,a1,0x10
[0-9a-f]+ <[^>]*> 30a5 7ffc 	addiu	a1,a1,32764
[0-9a-f]+ <[^>]*> 3080 0001 	li	a0,1
[0-9a-f]+ <[^>]*> 0084 8000 	sll	a0,a0,0x10
[0-9a-f]+ <[^>]*> 3084 8000 	addiu	a0,a0,-32768
[0-9a-f]+ <[^>]*> 30a0 ffff 	li	a1,-1
[0-9a-f]+ <[^>]*> 00a5 8000 	sll	a1,a1,0x10
[0-9a-f]+ <[^>]*> 30a5 7ffc 	addiu	a1,a1,32764
	\.\.\.
[0-9a-f]+ <[^>]*> 3080 0001 	li	a0,1
[0-9a-f]+ <[^>]*> 0084 8000 	sll	a0,a0,0x10
[0-9a-f]+ <[^>]*> 3084 8000 	addiu	a0,a0,-32768
[0-9a-f]+ <[^>]*> 30a0 ffff 	li	a1,-1
[0-9a-f]+ <[^>]*> 00a5 8000 	sll	a1,a1,0x10
[0-9a-f]+ <[^>]*> 30a5 7ffc 	addiu	a1,a1,32764
[0-9a-f]+ <[^>]*> 3080 0012 	li	a0,18
[0-9a-f]+ <[^>]*> 0084 8000 	sll	a0,a0,0x10
[0-9a-f]+ <[^>]*> 3084 ffdc 	addiu	a0,a0,-36
[0-9a-f]+ <[^>]*> 30a0 ffee 	li	a1,-18
[0-9a-f]+ <[^>]*> 00a5 8000 	sll	a1,a1,0x10
[0-9a-f]+ <[^>]*> 30a5 0024 	addiu	a1,a1,36
[0-9a-f]+ <[^>]*> 3080 0012 	li	a0,18
[0-9a-f]+ <[^>]*> 0084 8000 	sll	a0,a0,0x10
[0-9a-f]+ <[^>]*> 3084 ffdc 	addiu	a0,a0,-36
[0-9a-f]+ <[^>]*> 30a0 ffee 	li	a1,-18
[0-9a-f]+ <[^>]*> 00a5 8000 	sll	a1,a1,0x10
[0-9a-f]+ <[^>]*> 30a5 0024 	addiu	a1,a1,36
	\.\.\.
[0-9a-f]+ <[^>]*> 3080 0012 	li	a0,18
[0-9a-f]+ <[^>]*> 0084 8000 	sll	a0,a0,0x10
[0-9a-f]+ <[^>]*> 3084 ffdc 	addiu	a0,a0,-36
[0-9a-f]+ <[^>]*> 30a0 ffee 	li	a1,-18
[0-9a-f]+ <[^>]*> 00a5 8000 	sll	a1,a1,0x10
[0-9a-f]+ <[^>]*> 30a5 0024 	addiu	a1,a1,36
	\.\.\.