OBJ_FILES := calculate_sum.o conversion_lib.o

all: main.out

.PHONY: all

main.out: $(OBJ_FILES)
	ld $(OBJ_FILES) -o main.out

$(OBJ_FILES): %.o: %.asm
	nasm -f elf64 -o $@ $^

%.asm:
	touch $@
	
clean:
	rm *.o
.PHONY: clean


