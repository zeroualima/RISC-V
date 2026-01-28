/*
uint64_t affine(uint64_t a, uint64_t b, uint64_t x)
{
   return mult(x, a) + b;
}
*/

    .text
    .globl affine
    /* uint64_t affine(uint64_t a, uint64_t b, uint64_t x) */
/* DEBUT DU CONTEXTE
Fonction :
    affine : non feuille
Contexte :
    a : registre a0
    b : registre a1
    x : registre a2
FIN DU CONTEXTE */
affine:
  /* on reserve la place nécessaire dans la pile */
  addi sp, sp, -4*8 # a, b, x, ra
  sd ra, 4*8(sp)
  sd a2, 2*8(sp)
  sd a1, 1*8(sp)
  sd a0, 0*8(sp)
affine_fin_prologue:
    ld a0, 2*8(sp) # preparer x pour mult
    ld a1, 0*8(sp) # preparer a pour mult
    jal mult
    # Ici a0 contient le retour de mult(x, a)
    ld a1, 1*8(sp) # recupere b
    # return mult(x, a) + b;
    add a0, a0, a1 # addition et retour
affine_debut_epilogue:
    ld ra, 4*8(sp)
    addi sp, sp, 4*8
    ret
