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
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */
fact_papl:
/* A compléter */
fact_papl_fin_prologue:
fact_papl_debut_epilogue:
    ret
