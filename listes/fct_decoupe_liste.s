/*
struct cellule_t *decoupe_liste(struct cellule_t *l, struct cellule_t **l1, struct cellule_t **l2)
{
    struct cellule_t fictif1, fictif2;
    *l1 = &fictif1;
    *l2 = &fictif2;
    while (l != NULL) {
        if (l->val % 2 == 1) {
            (*l1)->suiv = l;
            *l1 = l;
        } else {
            (*l2)->suiv = l;
            *l2 = l;
        }
        l = l->suiv;
    }
    (*l1)->suiv = NULL;
    (*l2)->suiv = NULL;
    *l1 = fictif1.suiv;
    *l2 = fictif2.suiv;
    return l;
}
*/
    .text
    .globl decoupe_liste
/*
Fonction feuille : A priori pile inchangée, mais besoin de l'adresse des
variables locales => implantation des variables locales en pile.
Besoin de 2*2 mots de 64 bits dans la pile (PILE+32)
-> fictif1 à sp+0, fictif2 à sp+16
   (2 mots mémoire chacun : un pour le champ val, un pour le champ suiv)

DEBUT DU CONTEXTE
Fonction :
  decoupe_liste : feuille
Contexte :
  l             : registre a0    # paramètre de type (struct cellule_t *)
  l1            : registre a1    # paramètre de type (struct cellule_t **)
  l2            : registre a2    # paramètre de type (struct cellule_t **)
  fictif2.suiv  : pile *(sp+24)  # champ de type (cellule_t *)
  fictif2.val   : pile *(sp+16)  # champ de type (int64_t)
  fictif1.suiv  : pile *(sp+8)   # champ de type (cellule_t *)
  fictif1.val   : pile *(sp+0)   # champ de type (int64_t)
FIN DU CONTEXTE */
decoupe_liste:
    addi sp, sp, -4*8
decoupe_liste_fin_prologue:
    sd sp, 0*8(a1) # *l1 = &fictif1;
    addi t0, sp, 16
    sd t0, 0*8(a2) # *l2 = &fictif2;
while:
    beq a0, zero, fin_while
    ld t0, 0*8(a0) # t0 = l->val
    li t1, 2
    rem t1, t0, t1 # t1 = l->val % 2
    li t0, 1
    bne t1, t0, else
    ld t0, 0*8(a1) # t0 = *l1
    sd a0, 1*8(t0) # (*l1)->suiv = l;
    sd a0, 0*8(a1) # *l1 = l;
    j fin_if
else:
    ld t0, 0*8(a2) # t0 = *l2
    sd a0, 1*8(t0) # (*l2)->suiv = l;
    sd a0, 0*8(a2) # *l2 = l;
fin_if:
    ld a0, 1*8(a0) # l = l->suiv;
    j while
fin_while:
    ld t0, 0*8(a1) # t0 = *l1
    sd zero, 1*8(t0) # (*l1)->suiv = NULL;
    ld t0, 0*8(a2) # t0 = *l2
    sd zero, 1*8(t0) # (*l2)->suiv = NULL;
    ld t0, 1*8(sp) # t0 = fictif1.suiv
    sd t0, 0*8(a1) # *l1 = fictif1.suiv;
    ld t0, 3*8(sp) # t0 = fictif2.suiv
    sd t0, 0*8(a2) # *l2 = fictif2.suiv;
decoupe_liste_debut_epilogue:
    addi sp, sp, 4*8
    ret
