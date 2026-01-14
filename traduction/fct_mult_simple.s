/*
// dans la mémoire globale et à allouer en langage d'assemblage
uint64_t x=7, y=8;
uint64_t res=42;

uint64_t mult_simple(void)
{
    res = 0;
    while (y != 0) {
        res = res + x;
        y--;
    }
    return res;
}
*/
    .text
    .globl mult_simple, entry
/* DEBUT DU CONTEXTE
Fonction :
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */
entry:
mult_simple:
mult_simple_fin_prologue:
/* A compléter */
mult_simple_debut_epilogue:
    /* éteindre la machine virtuelle QEMU. */
eteindre_qemu:
    li a0,0x100000
    li a1,0x5555
    sw a1,0(a0)
    ret # pour l'infrastructure d'évaluation automatique


    .data
/* uint64_t x=7, y=8, res=42; 
On utilisera l'attribut .weak (au lieu de .globl) pour éviter des erreurs 
d'édition de lien si x, y ou res sont déjà définies dans un autre fichier (par exemple decls.c).
*/
