/*
uint64_t fibo(uint64_t n);
{
    uint64_t fibo_temp;
    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else {
	fibo_temp = fibo(n - 1);
        return fibo_temp + fibo(n - 2);
    }
}
*/
    .text
    /* uint64_t fibo(uint64_t n) */
    .globl fibo
/* DEBUT DU CONTEXTE
Fonction :
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */
fibo:
fibo_fin_prologue:
fibo_debut_epilogue:
    ret
