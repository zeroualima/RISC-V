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
    n : registre a0
    tmp : registe t0
    ra  : pile *(sp+0)
FIN DU CONTEXTE */
fact_papl:
    addi sp, sp, -4*8 # n, ra
fact_papl_fin_prologue:
fact_papl_debut_epilogue:
    ret
