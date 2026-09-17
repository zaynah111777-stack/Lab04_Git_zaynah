.text
.globl main
    main:
        addi sp, x0, 500 # initialising sp
        addi x10, x0, 5 #initialsing num
        jal x1, ntri #jump to ntri function
        addi x11, x10, 0 #move to x11
        li x10, 1 #os number to print
        ecall
        beq x0, x0, exit #end
        ntri:
            addi sp, sp, -8 #adjust stack for 2 items
            sw x1, 4(sp) #saving ret address
            sw x10, 0(sp) #saving num
            addi x5, x0, 1 #x5=1
            bgt x10, x5, L1 #if num > 1, jump to L1
            addi x10, x0, 1 #return 1
            addi sp,sp, 8 #pop stack
            jalr x0, 0(x1) #return
        L1:
            addi x10, x10, -1 # num-1
            jal x1, ntri#recursive call
            addi x6, x10, 0 #saving result of ntri(num-1)
            lw x10, 0(sp) #restoring original num that was in the stack
            lw x1, 4(sp) #restoring return address that was in the stack
            addi sp,sp, 8 #stack readjusted
            add x10,x10,x6 #num + ntri(num-1)
            jalr x0, 0(x1) #return
        exit:
            j exit
