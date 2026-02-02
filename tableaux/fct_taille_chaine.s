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
    chaine : pile *(sp+8); registre a0
    taille : pile *(sp+0)
FIN DU CONTEXTE */

taille_chaine:
    addi sp, sp, -2*8
    sd a0, 1*8(sp)
taille_chaine_fin_prologue:
    sd zero, 0*8(sp) # uint64_t taille = 0;
while: 
    ld t0, 0*8(sp) # t0 = taille
    ld t1, 1*8(sp) # t1 = &chaine 
    add t2, t1, t0 # t2 = &(chaine + 8 * taille)  
    lbu t3, 0(t2) # t3 = chaine[taille]
    beqz t3, fin_while
    addi t0, t0, 1
    sd t0, 0*8(sp)
    j while
fin_while:
    ld a0, 0*8(sp)
taille_chaine_debut_epilogue:
    addi sp, sp, 2*8
    ret
