/*
void abr_vers_tab(struct noeud_t *abr)
{
    struct noeud_t *fd;
    if (abr != NULL) {
        abr_vers_tab(abr->fg);
        *ptr = abr->val;
        ptr++;
        fd = abr->fd;
        free(abr);
        abr_vers_tab(fd);
    }
}
*/

    .text
    .globl abr_vers_tab
/* DEBUT DU CONTEXTE
Fonction :
    abr_vers_tab : non feuille
Contexte :
    ra : pile *(sp+8)
    abr : pile *(sp+0); registre a0
    ptr : mémoire
FIN DU CONTEXTE */
abr_vers_tab:
    addi sp, sp, -2*8
    sd ra, 1*8(sp)
    sd a0, 0*8(sp)
abr_vers_tab_fin_prologue:
    beqz a0, abr_vers_tab_debut_epilogue

    ld t5, 0(a0) # a0 = abr->val
    addi a0, a0, 8 # a0 = &(abr->fg)
    ld a0, 0*8(a0) # a0 = abr->fg

    jal abr_vers_tab # abr_vers_tab(abr->fg);

    ld a0, 0*8(sp) # a0 = abr
    ld t0, 0*8(a0) # t0 = abr->val
    ld t1, ptr # t1 = ptr
    sd t0, 0*8(t1) # *ptr = abr->val;

    addi t1, t1, 8
    la t2, ptr
    sd t1, 0(t2) # ptr++;

    ld a0, 0*8(sp) # a0 = abr
    addi t3, a0, 16 # t3 = &(abr->fd)
    ld t3, 0*8(t3) # t3 = abr->fd
    jal free # free(abr);

    mv a0, t3
    jal abr_vers_tab
abr_vers_tab_debut_epilogue:
    ld ra, 1*8(sp)
    addi sp, sp, 2*8
    ret

    .data
    .weak ptr
    ptr:
        .quad 0


