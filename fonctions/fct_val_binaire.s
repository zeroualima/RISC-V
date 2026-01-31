/*
uint16_t val_binaire(uint8_t b15, uint8_t b14, uint8_t b13, uint8_t b12,
                     uint8_t b11, uint8_t b10, uint8_t b9, uint8_t b8,
                     uint8_t b7, uint8_t b6, uint8_t b5, uint8_t b4,
                     uint8_t b3, uint8_t b2, uint8_t b1, uint8_t b0)
{
    return
      (b15 << 15) | (b14 << 14) | (b13 << 13) | (b12 << 12) | (b11 << 11) | (b10 << 10) | (b9 << 9) | (b8 << 8)
      | (b7 << 7) | (b6 << 6) | (b5 << 5) | (b4 << 4) | (b3 << 3) | (b2 << 2) | (b1 << 1) | b0;
}
*/

    .text
    .globl val_binaire
/*
uint16_t val_binaire(uint8_t b15, uint8_t b14, uint8_t b13, uint8_t b12,
                     uint8_t b11, uint8_t b10, uint8_t b9, uint8_t b8,
                     uint8_t b7, uint8_t b6, uint8_t b5, uint8_t b4,
                     uint8_t b3, uint8_t b2, uint8_t b1, uint8_t b0); */
/* DEBUT DU CONTEXTE
Fonction :
    val_binaire : feuille
Contexte :
    b15 : registre a0
    b14 : registre a1
    b13 : registre a2
    b12 : registre a3
    b11 : registre a4
    b10 : registre a5
    b9 : registre a6
    b8 : registre a7
    b7 : pile *(sp+72)
    b6 : pile *(sp+80)
    b5 : pile *(sp+88)
    b4 : pile *(sp+96)
    b3 : pile *(sp+104)
    b2 : pile *(sp+112)
    b1 : pile *(sp+120)
    b0 : pile *(sp+128)
FIN DU CONTEXTE */
val_binaire:
    /* on reserve la place nécessaire dans la pile pour b15, ..., b8 */
    /* pas de ra car on appelle aucune fonction */
    addi sp, sp, -8*8
val_binaire_fin_prologue:
    /* a0, ..., a7 et *(sp+72), ..., *(sp+128) contiennent deja les valeurs des arguments */
    slli a0, a0, 15 # a0 = b15 << 15
    slli a1, a1, 14
    slli a2, a2, 13
    slli a3, a3, 12
    slli a4, a4, 11
    slli a5, a5, 10
    slli a6, a6, 9
    slli a7, a7, 8 # a7 = b8 << 8

    lbu t0, 8*8(sp) # t0 = b7
    lbu t1, 9*8(sp)
    lbu t2, 10*8(sp)
    lbu t3, 11*8(sp)
    lbu t4, 12*8(sp)
    lbu t5, 13*8(sp)
    lbu t6, 14*8(sp) # t6 = b1

    slli t0, t0, 7
    slli t1, t1, 6
    slli t2, t2, 5
    slli t3, t3, 4
    slli t4, t4, 3
    slli t5, t5, 2
    slli t6, t6, 1

    or a0, a0, a1 # a0 = (b15 << 15) | (b14 << 14)
    or a0, a0, a2
    or a0, a0, a3
    or a0, a0, a4
    or a0, a0, a5
    or a0, a0, a6
    or a0, a0, a7 
    or a0, a0, t0
    or a0, a0, t1
    or a0, a0, t2
    or a0, a0, t3
    or a0, a0, t4
    or a0, a0, t5
    or a0, a0, t6 /* a0 = (b15 << 15) | (b14 << 14) | (b13 << 13) | (b12 << 12) | (b11 << 11) | (b10 << 10) | (b9 << 9) | (b8 << 8)
                    | (b7 << 7) | (b6 << 6) | (b5 << 5) | (b4 << 4) | (b3 << 3) | (b2 << 2) | (b1 << 1) */
    lbu t0, 15*8(sp) # t0 = b0
    slli t0, t0, 15
    or a0, a0, t0
val_binaire_debut_epilogue:
    addi sp, sp, 8*8
    ret
