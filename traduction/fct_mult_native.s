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
    mult_native : feuille
Contexte :
    x : mémoire
    y : mémoire
FIN DU CONTEXTE */
entry:
mult_native:
mult_native_fin_prologue:
    la t0, x
    ld t1, 0(t0)
    la t2, y
    ld t3, 0(t2)
    mul t4, t1, t3
    mv a0, t4
mult_native_debut_epilogue:
    /* éteindre la machine virtuelle QEMU. */
eteindre_qemu:
    li   a0, 0x100000
    li   a1, 0x5555
    sw   a1, 0(a0)
    ret # pour l'infrastructure d'évaluation automatique


    .data
    .weak x, y # A la place de .globl, pour l'évaluation automatique avec gdb
/* uint64_t x=5, y=16; */
/*On utilisera l'attribut .weak (au lieu de .globl) pour éviter des erreurs 
d'édition de lien si x ou y sont déjà définies dans un autre fichier (par exemple decls.c).*/
    .weak x, y
    x:
        .quad 5
    y:
        .quad 16
