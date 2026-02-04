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
    .globl tri_nain_opt
/* Version du tri optimisée sans respecter la contrainte de la traduction
   systématique pour les accès mémoire (et le calcul de leurs adresses)
   Complétez le contexte ci-dessous en indiquant les registres qui contiendront
   des variables temporaires.  */
/* DEBUT DU CONTEXTE
Fonction :
    tri_nain_opt : feuille
Contexte :
    tab     : registre a0
    taille  : registre a1
    i       : registre t0
    tmp     : registre t1
    &tab[i] : registre t2
    tab[i]  : registre t3
    tab[i+1]: registre t4
FIN DU CONTEXTE */
tri_nain_opt:
tri_nain_opt_fin_prologue:
    li t0, 0
while:
    addi t3, a1, -1
    bge t0, t3, fin_while

    # Preparation de tab[i]
    li t2, 8
    mul t2, t2, t0
    add t2, t2, a0 # t2 = &tab[i] = tab + 8*i
    ld t3, 0(t2) # t3 = tab[i]

    # # Preparation de tab[i + 1]
    ld t4, 1*8(t2) # t4 = tab[i + 1]

    /* if (tab[i] > tab[i+1]) */
    ble t3, t4, else1
    mv t1, t3 # tmp = tab[i]
    sd t4, 0(t2) # tab[i] = tab[i + 1]
    sd t1, 1*8(t2) # tab[i + 1] = tmp
    
    /* if (i > 0) */
    blez t0, else2
    addi t0, t0, -1
    j while
else2:
    j while
else1:
    addi t0, t0, 1
    j while
fin_while:
tri_nain_opt_debut_epilogue:
    ret
