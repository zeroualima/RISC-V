/*
uint64_t fibo(uint64_t n);
{
    uint64_t fibo_temp;
    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else {
	    fibo_temp = fibo(n - 1);
        return fibo_temp + fibo(n - 2);
    }
}
*/
    .text
    /* uint64_t fibo(uint64_t n) */
    .globl fibo
/* DEBUT DU CONTEXTE
Fonction :
    fibo : non feuille
Contexte :
    ra : pile *(sp+16)
    n : pile *(sp+8); registre a0
    fibo_temp : pile *(sp+0)
FIN DU CONTEXTE */
fibo:
    addi sp, sp, -3*8 # fibo_temp, n, ra
    sd ra, 2*8(sp)
    sd a0, 1*8(sp)
fibo_fin_prologue:
    ld a0, 1*8(sp)
    bnez a0, 1f
    mv a0, zero
    j fibo_debut_epilogue
1:
    ld a0, 1*8(sp)
    li t0, 1
    bne a0, t0, 2f
    mv a0, t0
    j fibo_debut_epilogue
2: 
    ld a0, 1*8(sp)
    addi a0, a0, -1
    jal fibo
    # a0 = fibo(n - 1)
    sd a0, 0*8(sp)
    ld a0, 1*8(sp)
    addi a0, a0, -2
    jal fibo
    # a0 = fibo(n - 2)
    ld t0, 0*8(sp) # t0 = fibo_temp
    add a0, a0, t0
    j fibo_debut_epilogue
fibo_debut_epilogue:
    ld ra, 2*8(sp)
    addi sp, sp, 3*8
    ret
