

NAME= f
CC= nasm

$(NAME): $(NAME).o
	ld -m elf_i386 -o $(NAME) $(NAME).o

	
$(NAME).o: $(NAME).asm
	$(CC) -f elf -g -F stabs $(NAME).asm -l $(NAME).lst

	
.PHONY clean:
	rm $(NAME)
	rm $(NAME).lst
	rm $(NAME).o

	
