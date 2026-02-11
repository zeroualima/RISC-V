/*
bool abr_est_present_tail_call(uint64_t val, struct noeud_t *abr)
{
   if (abr == NULL) {
       return false;
   } else if (val == abr->val) {
       return true;
   } else if (val < abr->val) {
       return abr_est_present_tail_call(val, abr->fg);
   } else {
       return abr_est_present_tail_call(val, abr->fd);
   }
}
*/
    .text
    .globl abr_est_present_tail_call
/* DEBUT DU CONTEXTE
Fonction :
    abr_est_present_tail_call : feuille
Contexte :
    val : registre a0
    abr : registre a1
FIN DU CONTEXTE */
abr_est_present_tail_call:
abr_est_present_tail_call_fin_prologue:
    bne a1, zero, else_if1
    mv a0, zero
    j abr_est_present_tail_call_debut_epilogue
else_if1:
    ld t0, 0*8(a1) # t0 = abr->val
    bne a0, t0, else_if2
    li a0, 1
    j abr_est_present_tail_call_debut_epilogue
else_if2:
    bge a0, t0, else
    ld a1, 1*8(a1) # a1 = abr->fg
    j abr_est_present_tail_call
else:
    ld a1, 2*8(a1) # a1 = abr->fd
    j abr_est_present_tail_call
abr_est_present_tail_call_debut_epilogue:
    ret
