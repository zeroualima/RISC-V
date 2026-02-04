/*
void tri_nain(int64_t tab[], uint64_t taille)
{
    uint64_t i = 0;
    while(i < taille - 1) {
        if (tab[i] > tab[i+1]) {
            int64_t tmp = tab[i];
            tab[i] = tab[i+1];
            tab[i + 1] = tmp;
            if (i > 0) {
                i = i - 1;
            }
        } else {
            i = i + 1;
        }
    }
}
*/

    .text
    .globl tri_nain_superopt
/* Version encore plus optimisée sans rien respecter (tout se perd ma bonne dame !).

Optimisations effectuées:
  - Partage des lectures mémoires et des calculs d'adresses
  - Calcul de taille - 1 en dehors de la boucle
  - À compléter avec vos autres optimisations

DEBUT DU CONTEXTE
Fonction :
    tri_nain_superopt : feuille
Contexte :
#   À compléter pour vous, mais laissez tout en commentaire (après '#'), sauf les paramètres
    tab     : registre a0
    taille  : registre a1
#   i       : registre t0
#   tmp     : registre t1
#   &tab[i] : registre t2
#   tab[i]  : registre t3; mémoire
#   tab[i+1]: registre t4; mémoire
#   taille - 1 : registre t5
FIN DU CONTEXTE */
tri_nain_superopt:
tri_nain_superopt_fin_prologue:
    li t0, 0
    li t6, 8
    addi t5, a1, -1
while:
    bge t0, t5, fin_while

    # Preparation de &tab[i]
    mul t2, t6, t0
    add t2, t2, a0 # t2 = &tab[i] = tab + 8*i

    ld t3, 0(t2) # t3 = tab[i]
    ld t4, 1*8(t2) # t4 = tab[i + 1]

    /* if (tab[i] > tab[i+1]) */
    ble t3, t4, else1
    sd t4, 0(t2) # tab[i] = tab[i + 1]
    sd t3, 1*8(t2) # tab[i + 1] = tmp
    
    /* if (i > 0) */
    blez t0, while
    addi t0, t0, -1
    j while
else1:
    addi t0, t0, 1
    j while
fin_while:
tri_nain_superopt_debut_epilogue:
    ret
