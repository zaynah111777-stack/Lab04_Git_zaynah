.text
.globl main
    main:
        addi x10, x0, 5 #n=5
        jal x1, fact_b #jump to fact_b function
        beq x0, x0, end #end
        fact_b:
            addi x12, x0, 1 # initialising acc =1
        while:
            ble x10, x0, endwhile #if n<= 0 end the loop
            mul x12, x12, x10 #so acc = acc*n
            addi x10, x10, -1 #n = n-1
            beq x0, x0, while #loop back
        endwhile:
            add x10, x12, x0 # move final acc value into x10
            jalr x0, 0(x1) #return
    end:
        j end