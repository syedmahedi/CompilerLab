main:
	gcc -E test.c > testi.i
	gcc -S -masm=intel testi.i 
	as -o taskout.o testi.s 
	objdump -M intel -d taskout.o > testdump.dump 
	gcc -o test taskout.o