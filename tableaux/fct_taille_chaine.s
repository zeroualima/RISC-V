/*
uint64_t taille_chaine(const char *chaine)
{
    uint64_t taille = 0;
    while (chaine[taille] != '\0') {
        taille++;
    }
    return taille;
}
*/
    .text
    .globl taille_chaine
/* uint64_t taille_chaine(const char *chaine) */
/* DEBUT DU CONTEXTE
Fonction :
    taille_chaine : feuille
Contexte :
    chaine : registre a0
    taille : registre t0
FIN DU CONTEXTE */

taille_chaine:
taille_chaine_fin_prologue:
    # uint64_t taille = 0;
    li t0, 0 # mv t0, zero (Meme chose)
while: 
    add t1, a0, t0 # t1 = &(chaine + taille)  
    lbu t2, 0(t1) # t2 = chaine[taille]
    beqz t2, fin_while
    addi t0, t0, 1
    j while
fin_while:
    mv a0, t0
taille_chaine_debut_epilogue:
    ret
