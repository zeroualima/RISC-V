/*
uint64_t fact_papl(uint64_t n)
{
    if (n <= 1) {
        return 1;
    } else {
        uint128_t tmp = (uint128_t)n*fact_papl(n-1);
        if ((tmp >> 64) > 0)
            erreur_fact(n);
        return (uint64_t)tmp;
    }
}
*/

    .text
    .globl fact_papl
    /* uint64_t fact_papl(uint64_t n) */
/* DEBUT DU CONTEXTE
Fonction :
    fact_papl : non feuille
Contexte :
    ra  : pile *(sp+24)
    n : pile *(sp+16); registre a0
    tmp : pile *(sp+0) / *(sp+8)
FIN DU CONTEXTE */
fact_papl:
    addi sp, sp, -4*8 # tmp, n, ra
    sd ra, 3*8(sp)
fact_papl_fin_prologue:
    li t0, 1
    ld a0, 2*8(sp) # a0 = n
    bgt a0, t0, 1f
    /* if */
    li a0, 1 # return 1;
    j fact_papl_debut_epilogue
1: /* else */
    ld a0, 2*8(sp) # a0 = n
    addi a0, a0, -1
    jal fact_papl
    # a0 = fact_papl(n-1)
    ld t0, 2*8(sp) # t0 = n
    mul t1, t0, a0 # t0 = n*fact_papl(n-1) [0; 63]
    mulh t2, t0, a0 # t0 = n*fact_papl(n-1) [64; 127]
    sd t1, 0*8(sp) # uint128_t tmp = (uint128_t)n*fact_papl(n-1); [0; 63]
    sd t2, 1*8(sp) # uint128_t tmp = (uint128_t)n*fact_papl(n-1); [64; 127]
    # t2 = tmp >> 64
    blez t2, 2f # Jumps to 2 if (tmp >> 64) <= 0
    /* if */
    ld a0, 2*8(sp)
    jal erreur_fact
2:
    ld a0, 0*8(sp)
fact_papl_debut_epilogue:
    ld ra, 3*8(sp)
    addi sp, sp, 4*8
    ret
