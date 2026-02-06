/*
bool abr_est_present(uint64_t val, struct noeud_t *abr)
{
   if (abr == NULL) {
       return false;
   } else if (val == abr->val) {
       return true;
   } else if (val < abr->val) {
       return abr_est_present(val, abr->fg);
   } else {
       return abr_est_present(val, abr->fd);
   }
}
*/

    .text
    .globl abr_est_present
/* DEBUT DU CONTEXTE
Fonction :
    abr_est_present : non feuille
Contexte :
    ra : pile *(sp+0)
    abr : registre a1 
    val : registre a0
FIN DU CONTEXTE */
abr_est_present:
    addi sp, sp, -1*8
    sd ra, 0*8(sp)
abr_est_present_fin_prologue:
    bne a1, zero, else_if1
    mv a0, zero
    j abr_est_present_debut_epilogue
else_if1:
    ld t0, 0*8(a1) # t0 = abr->val
    bne a0, t0, else_if2
    li a0, 1
    j abr_est_present_debut_epilogue
else_if2:
    bge a0, t0, else
    ld a1, 1*8(a1) # a1 = abr->fg
    jal abr_est_present
    j abr_est_present_debut_epilogue
else:
    ld a1, 2*8(a1) # a1 = abr->fd
    jal abr_est_present
abr_est_present_debut_epilogue:
    ld ra, 0*8(sp)
    addi sp, sp, 1*8
    ret
