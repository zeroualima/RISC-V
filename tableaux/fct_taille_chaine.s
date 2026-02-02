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
    taille : pile *(sp+0)
FIN DU CONTEXTE */

taille_chaine:
    addi sp, sp, -1*8
taille_chaine_fin_prologue:
    sd zero, 0*8(sp) # uint64_t taille = 0;
while: 
    ld t0, 0*8(sp) # t0 = taille
    add t1, a0, t0 # t1 = &(chaine + taille)  
    lbu t2, 0(t1) # t2 = chaine[taille]
    beqz t2, fin_while
    addi t0, t0, 1
    sd t0, 0*8(sp)
    j while
fin_while:
    ld a0, 0*8(sp)
taille_chaine_debut_epilogue:
    addi sp, sp, 1*8
    ret
