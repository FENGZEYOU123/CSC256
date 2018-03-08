    .data
        endl:    .asciiz  "\n"   # used for cout << endl;
        albl:    .asciiz  "Value of a: " # label for a
        blbl:    .asciiz  "Value of b: " # label for b
        clbl:    .asciiz  "Value of c: " # label for c
        dlbl:    .asciiz  "Value of d: " # label for d
    .text

# a --> $s0
# b --> $s1
# c --> $s2
# d --> $s3

main:    
li       $s0, 5         # load value 5 to a
li       $s1, 6         # load value 6 to b
li       $s2, 7         # load value 7 to c
li       $s3, -1        # load value -1 to d
li       $t0, 10        # load value 10 to $t0 for next compare function

slt      $t1, $s0, $t0       # Set on $s0 less than $t0   a<10
add      $s0, $s0, 1         # If a<0 is true, then a= a +1
j         ENDIF1             # end of if0
beq      $t1, 0, Else1       # Branch on equal 0, means if false, a>=10
Else1 :
   addi   $s0, $s0, -1      # decrement a by 1
EndIf :

add   $s3, $s0, $s2       # d=a+c
add   $s2, $s0, $s3       # c=a+d

slt      $t1, $s1, $t0       # is b<10?
beq   $t1, 0, ELSE2       # if no, then go to else part
add   $s1, $s1, 1          # if yes, then increment b by 1
addi   $s2, $s2, -1       # and decrement, c by 1
j   ENDIF2                    # end of if
ELSE2 :
   addi   $s1, $s1, -1       # decrement b by 1
   add   $s2, $s2, 1       # and increment, c by 1
ENDIF2 :

add   $s0, $s2, $s1       # a=c+b
add   $s1, $s2, $s3       # b=c+d

slt      $t1, $s1, $s2        # is (b<c)?
slt      $t2, $s0, $s1       # is (a<b)?
beq   $t1, 0, ELSEIF       # if false, then go to ELSEIF
beq   $t2, 0, ELSEIF       # if false, then go to ELSEIF
add   $s3, $s0, $s1       # if true, d=a+b
j         DONE                   # DONE
ELSEIF :
   slt       $t1, $s2, $s1       # is (c<b)?
   slt       $t2, $s2, $s0       # is (c>a)?
   beq   $t1, 1, LABEL       # if true, goto LABEL
   beq   $t2, 1, LABEL       # if true, goto LABEL
   j         DONE           # if false, then DONE
LABEL:
   add       $s3, $s1, $s2     # d=b+c
DONE :

exit:
    la   $a0, albl      # puts albl into arg0 (a0 register) for cout
    addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing a string
    syscall             # make a syscall to system
    
    move $a0, $s0       # puts a into arg0 (a0 register) for cout
    addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int 
    syscall             # make a syscall to system

    la   $a0, endl      # puts the address of the string endl into a0
    addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
    syscall

    la   $a0, blbl      # puts blbl into arg0 (a0 register) for cout
    addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing an string
    syscall             # make a syscall to system
    
    move $a0, $s1       # puts b into arg0 (a0 register) for cout
    addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int 
    syscall             # make a syscall to system

    la   $a0, endl      # puts the address of the string endl into a0
    addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
    syscall

    la   $a0, clbl      # puts clbl into arg0 (a0 register) for cout
    addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing a string
    syscall             # make a syscall to system
    
    move $a0, $s2       # puts c into arg0 (a0 register) for cout
    addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int 
    syscall             # make a syscall to system

    la   $a0, endl      # puts the address of the string endl into a0
    addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
    syscall

    la   $a0, dlbl      # puts dlbl into arg0 (a0 register) for cout
    addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing a string
    syscall             # make a syscall to system
    
    move $a0, $s3       # puts d into arg0 (a0 register) for cout
    addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int 
    syscall             # make a syscall to system

    la   $a0, endl      # puts the address of the string endl into a0
    addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
    syscall
   
    addi $v0,$0, 10
    syscall
