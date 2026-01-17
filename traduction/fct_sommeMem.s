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
    sommeMem : feuille
Contexte :
    res : registre t0
    i : registre t1
FIN DU CONTEXTE */
entry:
sommeMem:
sommeMem_fin_prologue:
    la t0, res # t0 = &res
    li t2, 0
    sd t2, 0(t0) # res = 0
    li t1, 1
    li t3, 10
    /* for (i = 1; i <= 10; i++) { */
loop:
    blt t3, t1, endloop
    /* res = res + i; */
    ld t2, 0(t0) # t2 = *x 
    add t2, t2, t1 # t2 = t2 + i 
    sd t2, 0(t0) # *x = t2  
    addi t1, t1, 1
    j loop
endloop:
    ld t2, 0(t0)
    mv a0, t2
sommeMem_debut_epilogue:
    /* éteindre la machine virtuelle QEMU. */
eteindre_qemu:
    li a0,0x100000
    li a1,0x5555
    sw a1,0(a0)
    ret # pour l'infrastructure d'évaluation automatique

    .data
    .weak res
    res :
        .zero 8
/* uint64_t res;
  La variable globale res étant définie dans ce fichier, il est nécessaire de
  la définir dans la section .data du programme assembleur.
  On utilisera l'attribut .weak (au lieu de .globl) pour éviter des erreurs 
  de linkage si res est déjà définie dans un autre fichier (par exemple decls.c).
*/
