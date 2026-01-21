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
    mult_simple : feuille
Contexte :
    x : mémoire
    y : mémoire
    res : mémoire
FIN DU CONTEXTE */
entry:
mult_simple:
mult_simple_fin_prologue:
    # res = 0;
    la t0, res # t0 = &res
    li t1, 0 # t1 = 0
    sd t1, 0(t0) # *t0 = t1
# while (y != 0) {
while:
    la t0, y # t0 = &y
    ld t1, 0(t0) # t1 = *t0
    li t2, 0
    beq t1, t2, fin_while
    # res = res + x;
    la t0, res # t0 = &res
    ld t1, 0(t0) # t1 = *t0
    la t2, x # t2 = &x
    ld t3, 0(t2) # t3 = *t2
    add t3, t3, t1
    sd t3, 0(t0)
    # y--;
    la t0, y
    ld t1, 0(t0)
    addi t1, t1, -1
    sd t1, 0(t0)
    j while
fin_while:
    la t0, res
    ld t1, 0(t0)
    mv a0, t1 
mult_simple_debut_epilogue:
    /* éteindre la machine virtuelle QEMU. */
eteindre_qemu:
    li   a0, 0x100000
    li   a1, 0x5555
    sw   a1, 0(a0)
    ret # pour l'infrastructure d'évaluation automatique


    .data
/* uint64_t x=7, y=8, res=42; 
On utilisera l'attribut .weak (au lieu de .globl) pour éviter des erreurs 
d'édition de lien si x, y ou res sont déjà définies dans un autre fichier (par exemple decls.c).
*/
    .weak x, y, res # A la place de .globl, pour l'évaluation automatique avec gdb
    /* uint64_t x=7, y=8, res=42; */
    x:
        .quad 7
    y:
        .quad 8
    res:
        .quad 42
