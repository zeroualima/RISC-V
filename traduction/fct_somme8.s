/*
uint8_t res8=42; // La variable est initialisée à autre chose que la valeur finale attendue
// Et n'est pas mis à 0 pour s'assurer que c'est bien somme8 qui fait le travail.

uint8_t somme8(void)
{
    uint8_t i;
    res8 = 0;
    for (i = 1; i <= 30; i++) {
        res8 = res8 + i;
    }
    return res8;
}
*/

    .text
    .globl somme8, entry
/* DEBUT DU CONTEXTE
Fonction :
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */
entry:
somme8:
somme8_fin_prologue:
/* A compléter */
somme8_debut_epilogue:
    /* éteindre la machine virtuelle QEMU. */
eteindre_qemu:
    li   a0, 0x100000
    li   a1, 0x5555
    sw   a1, 0(a0)
    ret # pour l'infrastructure d'évaluation automatique


    .data
    .globl res8
/* uint8_t res8=42;
  La variable globale res8 étant définie dans ce fichier, il est nécessaire de
  la définir dans la section .data du programme assembleur.
*/
