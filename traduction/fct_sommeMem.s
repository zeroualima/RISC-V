/*
uint64_t res;

void sommeMem(void)
{
    uint64_t i;
    res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
}
*/

    .text
    .globl sommeMem, entry
/* DEBUT DU CONTEXTE
Fonction :
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */
entry:
sommeMem:
sommeMem_fin_prologue:
/* A compléter */
sommeMem_debut_epilogue:
    /* éteindre la machine virtuelle QEMU. */
eteindre_qemu:
    li a0,0x100000
    li a1,0x5555
    sw a1,0(a0)
    ret # pour l'infrastructure d'évaluation automatique


    .data
    .globl res
/* uint64_t res;
  La variable globale res étant définie dans ce fichier, il est nécessaire de
  la définir dans la section .data du programme assembleur.
  On utilisera l'attribut .weak (au lieu de .globl) pour éviter des erreurs 
  de linkage si res est déjà définie dans un autre fichier (par exemple decls.c).
*/
