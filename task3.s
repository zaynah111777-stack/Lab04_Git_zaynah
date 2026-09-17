.text
.globl main
    main:
        li x10, 0x200 #address for array a
        li x11, 3 #length = 3
        li x12, 21 #populating array
        sw x12, 0(x10) #storing 21 in array a
        li x12, 1 #populating array
        sw x12, 4(x10) #storing 1 in array a
        li x12, 20 #populating array
        sw x12, 8(x10) #storing 20 in array a
        beq x11, x0, end #if len == 0 return
        li x13, 0 #i=0
        loop1:
            beq x13, x11, end #if i == len, end
            add x14, x0, x13  #j=i
        loop2:
            beq x14, x11, end_j #if j == len, exit loop
            slli x15, x13, 2 #offset i*4
            add x16, x10, x15 #base address+offset
            lw x17, 0(x16) #load a[i] into x17
            slli x18, x14, 2 #offset j*4
            add x19, x10, x18 #base address+offset
            lw x20, 0(x19) #load a[j] into x20
            bge x17, x20, no_swap #if a[i] >= a[j] no swap
            #swapping
            sw x20, 0(x16) #storing a[i] into a[j]
            sw x17, 0(x19) #store a[j] into a[i] 
        no_swap:
            addi x14, x14, 1 #j++
            beq x0,x0,loop2 #loop back to inner loop
        end_j:
            addi x13,x13,1 #i++
            beq x0, x0, loop1 #loop back to outer loo  
        end:
            j end #end of program







