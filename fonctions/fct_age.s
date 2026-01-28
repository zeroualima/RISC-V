/*
uint64_t age(uint64_t annee_naissance)
{
    uint64_t age;
    age = 2000 - annee_naissance;
    return age;
}
*/

    .text
    .globl age
    /* uint64_t age(uint64_t annee_naissance) */
/* DEBUT DU CONTEXTE
Fonction :
    age : feuille
Contexte : # contexte imposé
    annee_naissance  : registre a0
    age              : pile *(sp+0)  # de type uint64_t
FIN DU CONTEXTE */
age:
    /* on reserve la place nécessaire dans la pile */
    addi sp, sp, -8 # uint64_t age;
age_fin_prologue:
    /* age = 2000 - annee_naissance; */
    li t0, 2000
    sub t1, t0, a0
    sd t1, 0(sp)
    mv a0, t1
age_debut_epilogue:
    addi sp, sp, 8 /* on libère la pile */
    ret
