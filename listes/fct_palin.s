/*
bool palin(const char *ch)
{
    uint64_t inf, sup;
    inf = 0;
    sup = strlen(ch) - 1;
    while (inf < sup && ch[inf] == ch[sup]) {
        inf++;
        sup--;
    }
    return inf >= sup;
}
*/
    .text
    .globl palin
	.type palin, @function
    /* bool palin(char *ch) */
/* DEBUT DU CONTEXTE
Fonction :
    palin : non feuille
Contexte :
    ra : pile *(sp+1)
    ch : pile *(sp+0); registre a0
    inf : registre t0
    sup : registre t1
FIN DU CONTEXTE */
palin:
    addi sp, sp, -2*8 # ch, ra
    sd ra, 1*8(sp)
    sd a0, 0*8(sp)
palin_fin_prologue:
    li t0, 0 # inf = 0;
    jal strlen
    addi t1, a0, -1 # sup = strlen(ch) - 1;
while:
    bge t0, t1, fin_while # condition : inf >= sup
    ld a0, 0*8(sp) # a0 = ch
    add t2, a0, t0
    lbu t2, 0(t2) # t2 = ch[inf]
    add t3, a0, t1
    lbu t3, 0(t3) # t3 = ch[sup]
    bne t2, t3, fin_while
    addi t0, t0, 1
    addi t1, t1, -1
    j while
fin_while:
    sltu a0, t0, t1 # contains 1 if inf < sup, and 0 if inf >= sup
    xori a0, a0, 1
palin_debut_epilogue:
    ld ra, 1*8(sp)
    addi sp, sp, 2*8
    ret
	.size palin, . - palin
