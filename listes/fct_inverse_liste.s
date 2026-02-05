/*
void inverse_liste(struct cellule_t **l)
{
   struct cellule_t *res, *suiv;
   res = NULL;
   while (*l != NULL) {
       suiv = (*l)->suiv;
       (*l)->suiv = res;
       res = *l;
       *l = suiv;
   }
   *l = res;
}
*/
    .text
    .globl inverse_liste
/* void inverse_liste(struct cellule_t **l) */
/* DEBUT DU CONTEXTE
Fonction :
    inverse_liste : feuille
Contexte :
    l    : registre a0  # argument de type (struct cellule_t **)
    res  : registre t0  # variable locale de type (struct cellule_t *)
    suiv : registre t1  # variable locale de type (struct cellule_t *)

FIN DU CONTEXTE */
inverse_liste:
inverse_liste_fin_prologue:
    li t0, 0 # res = NULL;
while:
    ld t2, 0*8(a0) # t2 = *l
    beq t2, zero, fin_while
    ld t1, 1*8(t2) # t1 = (*l)->suiv
    sd t0, 1*8(t2) # (*l)->suiv = res;
    mv t0, t2 # res = *l;
    sd t1, 0*8(a0) # *l = suiv;
    j while
fin_while:
    sd t1, 0*8(a0) # *l = res;
inverse_liste_debut_epilogue:
    ret
