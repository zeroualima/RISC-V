/*
uint64_t x=5, y=16;

uint64_t mult_egypt(void)
{
    uint64_t res = 0;
    while (y != 0) {
        if (y % 2 == 1) {
            res = res + x;
        }
        x = x << 1 ;
        y = y >> 1;
    }
    return res;
}
*/
    .text
    .globl mult_egypt, entry
/* Attention, res est une variable locale que l'on mettra dans t0 */
/* DEBUT DU CONTEXTE
Fonction :
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */
entry:
mult_egypt:
mult_egypt_fin_prologue:
/* A compléter */
mult_egypt_debut_epilogue:
    /* éteindre la machine virtuelle QEMU. */
eteindre_qemu:
    li a0,0x100000
    li a1,0x5555
    sw a1,0(a0)
    ret # pour l'infrastructure d'évaluation automatique


    .data
/* uint64_t x=5, y=16; */
/* On utilisera l'attribut .weak (au lieu de .globl) pour éviter des erreurs 
d'édition de lien si x ou y sont déjà définies dans un autre fichier */

