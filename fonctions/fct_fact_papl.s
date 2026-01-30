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
    sltu t1, t0, a0 /* Le registre t1 est utilisé pour stocker le résultat du test n > 1 */
    bnez t1, 1f # Si n > 1, Jump vers 1
    li a0, 1 # return 1;
1: /* else */


fact_papl_debut_epilogue:
    ld ra, 3*8(sp)
    addi sp, sp, 4*8
    ret
