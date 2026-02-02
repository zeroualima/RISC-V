/*
void tri_min(int64_t tab[], uint64_t taille)
{
    uint64_t i, j, ix_min;
    int64_t tmp;
    for (i = 0; i < taille - 1; i++) {
        for (ix_min = i, j = i + 1; j < taille; j++) {
            if (tab[j] < tab[ix_min]) {
                ix_min = j;
            }
        }
        tmp = tab[i];
        tab[i] = tab[ix_min];
        tab[ix_min] = tmp;
    }
}
*/
    .text
    .globl tri_min
/* void tri_min(int64_t tab[], uint64_t taille) */
/* DEBUT DU CONTEXTE
Fonction :
    tri_min : feuille
Contexte :
    tab : registre a0
    taille : registre a1
    i : registre t0
    j : registre t1
    ix_min : registre t2
    tmp : registre t3
FIN DU CONTEXTE */
tri_min:
tri_min_fin_prologue:
    li t0, 0
for1:
    addi t4, a1, -1
    bge t0, t4, fin_for1
    mv t2, t0
    addi t1, t0, 1
for2:
    bge t1, a1, fin_for2
    li t4, 8
    mul t4, t4, t1
    add t4, a0, t4 # t4 = tab + 8*j
    ld t4, 0(t4) # t4 = tab[j]
    li t5, 8
    mul t5, t5, t2
    add t5, a0, t5 # t5 = tab + 8*ix_min
    ld t5, 0(t5) # t5 = tab[ix_min]
    bge t4, t5, else
    mv t2, t1
    addi t1, t1, 1
    j for2
else:
    addi t1, t1, 1
    j for2
fin_for2:
    li t4, 8
    mul t4, t4, t0
    add t4, a0, t4 # t4 = tab + 8*i
    ld t3, 0(t4) # t3 = tab[i]
    li t5, 8
    mul t5, t5, t2
    add t5, a0, t5 # t5 = tab + 8*ix_min
    ld t6, 0(t5) # t6 = tab[ix_min]
    sd t6, 0(t4)
    sd t3, 0(t5)
    addi t0, t0, 1
    j for1
fin_for1:
tri_min_debut_epilogue:
    ret

