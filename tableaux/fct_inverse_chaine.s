/*
void inverse_chaine(char *ptr, uint64_t taille)
{
    char tmp;
    int64_t dep = taille - 1;
    while (dep > 0) {
        tmp = *ptr;
        *ptr = ptr[dep];
        ptr[dep] = tmp;
        dep = dep - 2;
        ptr++;
    }
}
*/
    .text
    .globl inverse_chaine
/*void inverse_chaine(char *ptr, uint64_t taille) */
/* DEBUT DU CONTEXTE
Fonction :
    inverse_chaine : feuille
Contexte :
    ptr     : registre a0  # paramètre de type (char *)
    taille  : registre a1  # paramètre de type (uint64_t)
    tmp     : registre t0  # variable locale de type (char)
    dep     : registre t1  # variable locale de type (int64_t)
FIN DU CONTEXTE */
inverse_chaine:
inverse_chaine_fin_prologue:
    mv t1, a1 # dep = taille
    addi t1, t1, -1 # dep = taille - 1
while:
    blez t1, fin_while
    lbu t0, 0(a0) # tmp = *ptr;
    add t2, a0, t1 # t2 = ptr + dep
    lbu t3, 0(t2) # t3 = ptr[dep]
    sb t3, 0(a0) # *ptr = ptr[dep];
    sb t0, 0(t2) # ptr[dep] = tmp;
    addi t1, t1, -2 # dep = dep - 2;
    addi a0, a0, 1 # ptr++;
    j while
fin_while:
inverse_chaine_debut_epilogue:
    ret
