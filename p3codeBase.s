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
li       $s0, 5              # load value 5 to a
li       $s1, 6              # load value 6 to b
li       $s2, 7              # load value 7 to c
li       $s3, -1             # load value -1 to d
li       $t0, 10             # load value 10 to $t0 for next compare function

slt      $t1, $s0, $t0       # Set on $s0 less than $t0   a<10
beq      $t1, 0, Else1       # Branch on equal 0, means if the statement is false, a>=10, then run Else2
add      $s0, $s0, 1         # If a<10 is true, then a = a +1
j        ENDIF1              # Jump to End funtion
Else1 :
         addi   $s0, $s0, -1         # a = a-1
ENDIF1 :                             # End if function

add      $s3,$s2, $s0                # d = c+a
add      $s2,$s3, $s0                # c = d+a

slt      $t1, $s1, $t0               # Set on $s1 less than $t0   b<10
beq      $t1, 0, Else2               # Branch on equal 0, means if the statement is false, b>=10, then run Else2
add      $s1, $s1, 1                 # If b<10 is true, then a = a+1
addi     $s2, $s2, -1                # If b<10 is true, then c = c-1
j        ENDIF2                      # Jump to End funtion
Else2 :
         add    $s2, $s2,  1         # c = c+1
         addi   $s1, $s1, -1         # b = b-1
ENDIF2 :                             # End if function

add      $s0, $s1, $s2               # a=b+c
add      $s1, $s3, $s2               # b=d+c

slt      $t1, $s1, $s2               # Set on $s1 less than $t2   b<c
slt      $t2, $s0, $s1               # Set on $s0 less than $ta   a<b
beq      $t1, 0, ElseIf              # Branch on equal 0, means if false, b>=c, then run ElseIf
beq      $t2, 0, ElseIf              # Branch on equal 0, means if false, a>=b, then run ElseIf
add      $s3, $s0, $s1               # If b<c or a<b are true, then d = a+b
j         ENDIF3                     # Jump to End funtion 
ElseIf :
   slt       $t1, $s2, $s1           # Set on $s2 less than $t1   c<b
   slt       $t2, $s2, $s0           # Set on $s2 less than $t0   c>a
   beq   $t1, 1, Else3               # Branch on equal 0, means if the statement is false, c>=b, then run Else3
   beq   $t2, 1, Else3               # Branch on equal 0, means if the statement is false, c>=a, then run Else3
   j         ENDIF3                  # Jump to End funtion if "ElseIf" statement is False
Else3:   
   add       $s3, $s1, $s2           # d=b+c
ENDIF3 :

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
