.text
.globl main
    main:
        addi sp, x0, 500 # initialising sp
        addi x10, x0, 5 #initialsing n
        jal x1, fact #jump to fact function
        beq x0, x0, exit #end
        fact:
            addi sp, sp, -8 #adjust stack for 2 items
            sw x1, 4(sp) #saving ret address
            sw x10, 0(sp) #saving n
            addi x5, x10, -1 #x5=n-1
            bge x5, x0, L1 #if n-1 >= 0, jump to L1
            addi x10, x0, 1 #return 1
            addi sp,sp, 8 #pop stack
            jalr x0, 0(x1) #return
        L1:
            addi x10, x10, -1 # n-1
            jal x1, fact#recursive call
            addi x6, x10, 0 #saving result of fact(n-1)
            lw x10, 0(sp) #restoring original n that was in the stack
            lw x1, 4(sp) #restoring return address that was in the stack
            addi sp,sp, 8 #stack readjusted
            mul x10,x10,x6 #n*fact(n-1)
            jalr x0, 0(x1) #return
        exit:
            j exit
