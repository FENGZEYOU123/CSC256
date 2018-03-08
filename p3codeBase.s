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
addi       $s0, 5              # add value 5 to a as initial
addi       $s1, 6              # add value 6 to b as initial
addi       $s2, 7              # add value 7 to c as initial
addi       $s3, -1             # add value -1 to d as initial
addi       $t0, 10             # add value 10 to $t0 for next compare function

blt      $s0, $t0, Lable1
bgt      $s0, $t0, Lable2       # Set on $s0 less than $t0   a<10
Lable1: 
         add  $s0, $s0, 1         # If a<10 is true, then a = a +1
j        End1                     # Jump to End funtion
Lable2 :
         addi $s0, $s0, -1         # a = a-1
j        End1                     # Jump to End funtion
End1 :                             # End if function

add      $s3,$s2, $s0                # d = c+a
add      $s2,$s3, $s0                # c = d+a

slt      $t1, $s1, $t0               # Set on $s1 less than $t0   b<10
beq      $t1, 0, Else2               # Branch on equal 0, means if the statement is false, b>=10, then run Else2
add      $s1, $s1, 1                 # If b<10 is true, then a = a+1
addi     $s2, $s2, -1                # If b<10 is true, then c = c-1
j        End2                        # Jump to End funtion
Else2 :
         add    $s2, $s2,  1         # c = c+1
         addi   $s1, $s1, -1         # b = b-1
End2 :                               # End if function

add      $s0, $s1, $s2               # a=b+c
add      $s1, $s3, $s2               # b=d+c

slt      $t1, $s1, $s2               # Set on $s1 less than $t2   b<c
sgt      $t2, $s1, $s0               # Set on $s0 less than $ta   b>a
beq      $t1, 0, ElseIf              # Branch on equal 0, means if false, b>=c, then run ElseIf
beq      $t2, 0, ElseIf              # Branch on equal 0, means if false, a>=b, then run ElseIf
add      $s3, $s0, $s1               # If b<c or a<b are true, then d = a+b
j         End3                       # Jump to End funtion 
ElseIf :
   sgt       $t1, $s1, $s2           # Set on $s2 less than $t1   b>c
   sgt       $t2, $s0, $s2           # Set on $s2 less than $t0   a>c
   beq   $t1, 1, Else3               # Branch on equal 0, means if the statement is false, c>=b, then run Else3
   beq   $t2, 1, Else3               # Branch on equal 0, means if the statement is false, c>=a, then run Else3
   j         End3                    # Jump to End funtion if "ElseIf" statement is False
Else3:   
   add       $s3, $s1, $s2           # d=b+c
End3:

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
