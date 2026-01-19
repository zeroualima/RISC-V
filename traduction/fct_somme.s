/*
uint64_t somme(void)
{
    uint64_t i;
    uint64_t res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
    return res;
}
*/
    .text
    .globl somme, entry
/* DEBUT DU CONTEXTE
Fonction :
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */
entry:
somme:
somme_fin_prologue:
/* A compléter */
somme_debut_epilogue:
    /* éteindre la machine virtuelle QEMU. */
eteindre_qemu:
    li   a0, 0x100000
    li   a1, 0x5555
    sw   a1, 0(a0)
    ret # pour l'infrastructure d'évaluation automatique
