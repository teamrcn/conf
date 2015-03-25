#
#  gdb .gdbinit file for 252 assembler lab
#  Modified for x86 by Les Kitchen <ljk@cs.mu.oz.au> from Zoltan
#  Somogyi's <zs@cs.mu.oz.au> SPARC version, 11 April 2002.
#
define xpc
        x/1i $eip
end
define xsi
        stepi
        xpc
end
define xni
        nexti
        xpc
end
define aregs
        info registers
end
define regs
        info registers $eax $ebx $ecx $edx $esp $ebp $esi $edi $eip
end
document xpc
Display the current assembler instruction.
end
document xsi
Step a single assembler instruction and then print the next one.
end
document xni
Step a single assembler instruction, unless the next instruction
is a function call, in which case skip the entire function,
and then print the next assembler instruction.
end
document regs
Prints the values of most important integer registers.
end
document aregs
Prints the values of pretty much all the CPU registers.
end
