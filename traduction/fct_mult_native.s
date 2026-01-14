/*
uint64_t x=5, y=16;

uint64_t mult_native(void)
{
    return x*y;
}
*/
    .text
    .globl mult_native, entry
/* DEBUT DU CONTEXTE
Fonction :
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */
entry:
mult_native:
mult_native_fin_prologue:
/* A compléter */
mult_native_debut_epilogue:
    /* éteindre la machine virtuelle QEMU. */
eteindre_qemu:
    li a0,0x100000
    li a1,0x5555
    sw a1,0(a0)
    ret # pour l'infrastructure d'évaluation automatique


    .data
/* uint64_t x=5, y=16; */
/*On utilisera l'attribut .weak (au lieu de .globl) pour éviter des erreurs 
d'édition de lien si x ou y sont déjà définies dans un autre fichier (par exemple decls.c).*/

