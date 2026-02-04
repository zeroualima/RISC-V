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
/*  void tri_nain(int64_t tab[], uint64_t taille) */
    .globl tri_nain
/* DEBUT DU CONTEXTE
Fonction :
    tri_nain : feuille
Contexte :
    tab     : registre a0
    taille  : registre a1
    i       : registre t0
    tmp     : registre t1
FIN DU CONTEXTE */
tri_nain:
tri_nain_fin_prologue:
    li t0, 0
while:
    addi t2, a1, -1
    bge t0, t2, fin_while

    # Preparation de tab[i]
    li t2, 8
    mul t2, t2, t0
    add t2, t2, a0 # t2 = tab + 8*i

    # Preparation de tab[i + 1]
    li t4, 8
    mul t4, t4, t0
    addi t4, t4, 8
    add t4, t4, a0 # t4 = tab + 8*(i + 1)

    /* if (tab[i] > tab[i+1]) */
    ld t3, 0(t2) # t3 = tab[i]
    ld t5, 0(t4) # t5 = tab[i + 1]
    ble t3, t5, else1

     # tmp = tab[i]
    ld t1, 0(t2)

    # tab[i] = tab[i+1]
    ld t5, 0(t4)
    sd t5, 0(t2)

    # tab[i+1] = tmp
    sd t1, 0(t4) # tab[i + 1] = tmp
    
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
tri_nain_debut_epilogue:
    ret
