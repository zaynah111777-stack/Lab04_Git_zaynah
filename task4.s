.text
.globl main
    main: #main lcm function
    #stack needed, functions will be nested/recursive
    #lcm value
    #lcm = (a*b)//gcd
    #gcd replaces the larger number with its remainder when divided by the smaller number
    #the last non zero remainder is the gcd(greatest common divisor)
        addi sp, x0, 700 #initialising stack
        li x10, 12 #first value x
        li x11, 18 #second value y
        addi sp, sp, -16 #adjusting stack for 3 items
        sw x1, 12(sp) #pushing return address
        sw x10, 8(sp) #pushing first value x onto stack
        sw x11, 4(sp) #pushing second value y onto stack
        jal x1, gcd #calling gcd function that calculates the greatest common divisor of x and y
        lw x6, 8(sp) #restoring original x
        lw x7, 4(sp) #restoring original y
        #calculating lcm
        div x8, x6, x10 #x8 = x/gcd
        mul x9, x8, x7 #x9 = lcm = x8*y
        add x11, x0, x9 #storing lcm in x11
        li x10, 1 #os number to print
        ecall
    end:
        jal x0, end #end of program
    gcd:
        addi sp, sp, -16 #allocating stack space
        sw x1, 12(sp) #pushing return address
        beq x11, x0, base #gcd base case, if y=0, x is already in x10
        #recursive step
        div x14, x10, x11 #x14 = x/y
        mul x15, x14, x11 #x15 = (x/y)*y
        sub x16, x10, x15 #x16 = x - (x/y)*y = remainder
        add x10, x0, x11 #x12 = y
        add x11, x0, x16 #x13 = remainder
        jal x1, gcd #recursive call to gcd
        jal x0, return #jump to return block
        base:
            #base case, if y=0, x is already in x10
        return:
            lw x1, 12(sp) #restoring return address
            addi sp, sp, 16 #adjusting stack back to original position
            jalr x0, 0(x1) #jump to return address

        





