/*
void hello(void)
{
	affiche_HelloWorld();
}
*/

    .text
    .globl hello
    /* void hello(void) */
/*
  Pas de paramètre, Pas de variable locale.
  ra doit être sauvegardé dans la pile pour ne pas être écrasé lors de l'appel de fonction.

DEBUT DU CONTEXTE
  Fonction :
    hello : non feuille
  Contexte :
    ra  : pile *(sp+0)
FIN DU CONTEXTE */
hello:
  /* on reserve la place nécessaire dans la pile */
  addi sp, sp, -1*8 # ra  : pile *(sp+0)
  sd ra, 0*8(sp)
hello_fin_prologue:
  jal affiche_HelloWorld
hello_debut_epilogue:
  ld ra, 0*8(sp)
  addi sp, sp, 8
  ret
