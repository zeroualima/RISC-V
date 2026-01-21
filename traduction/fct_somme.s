/*
uint64_t somme(void)
{
    uint64_t i;
    uint64_t res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
    return res;
}
*/
    .text
    .globl somme, entry
/* DEBUT DU CONTEXTE
Fonction :
    somme : feuille
Contexte :
    res : registre t0
    i : registre t1
FIN DU CONTEXTE */
entry:
somme:
somme_fin_prologue:
    /* uint64_t i; RIEN A FAIRE! */
    /* uint64_t res = 0; */
    li t0, 0
    li t1, 1
    li t2, 10
    /* for (i = 1; i <= 10; i++) { */
loop:
    blt t2, t1, endloop
    /* res = res + i; */
    add t0, t0, t1
    addi t1, t1, 1
    j loop
endloop:
    mv a0, t0
somme_debut_epilogue:
    /* éteindre la machine virtuelle QEMU. */
eteindre_qemu:
    li   a0, 0x100000
    li   a1, 0x5555
    sw   a1, 0(a0)
    ret # pour l'infrastructure d'évaluation automatique
