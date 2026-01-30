/*
uint64_t fact(uint64_t n)
{
    if (n <= 1) {
        return 1;
    } else {
        return n * fact(n - 1);
    }
}
*/

    .text
    .globl fact
    /* uint64_t fact(uint64_t n) */
/* DEBUT DU CONTEXTE
Fonction :
    fact : non feuille
Contexte :
    n : pile *(sp+0)
    ra  : pile *(sp+1)
FIN DU CONTEXTE */
fact:
    /* on reserve la place nécessaire dans la pile */
    addi sp, sp, -2*8 # n, ra
    sd ra, 1*8(sp)
    sd a0, 0*8(sp)
fact_fin_prologue:
    # Chargement des parametres dans la pile
    li t0, 1
    sltu t1, t0, a0 /* Le registre t1 est utilisé pour stocker le résultat du test n > 1 */
    bnez t1, 1f
    li a0, 1 # return 1;
    j fact_debut_epilogue
1:
    # preparation des arguments
    addi a0, a0, -1
    jal fact
    # ici a0 contient fact(n - 1)
    ld t0, 0*8(sp) # recupere n avant appel
    mul a0, a0, t0
fact_debut_epilogue:
    ld ra, 1*8(sp)
    addi sp, sp, 2*8 
    ret
