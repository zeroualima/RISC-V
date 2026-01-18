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
    mult_egypt : feuille
Contexte :
    x : mémoire
    y : mémoire
    res : registre t0
FIN DU CONTEXTE */
entry:
mult_egypt:
mult_egypt_fin_prologue:
    # uint64_t res = 0;
    li t0, 0
# while (y != 0) {
while:
    la t1, y
    ld t2, 0(t1)
    li t3, 0
    beq t2, t3, fin_while
    /* if (y % 2 == 1) { */
    li t3, 1
    li t4, 2
    remu t4, t2, t4 # t4 = *y % 2
    bne t4, t3, fin_if
    # res = res + x;
    la t3, x
    ld t4, 0(t3)
    add t0, t0, t4
    j fin_if
fin_if:
    # x = x << 1 ;
    la t3, x
    ld t4, 0(t3)
    slli t4, t4, 1
    sd t4, 0(t3)
    # y = y >> 1;
    la t1, y
    ld t2, 0(t1)
    srli t2, t2, 1
    sd t2, 0(t1)
    j while
fin_while:
    mv a0, t0
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
    .weak x, y
    x:
        .quad 5
    y:
        .quad 16
