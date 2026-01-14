/*
 * Hash function
 * Due à D. J. Bernstein, étonnamment bonne pour sa simplicité
 * key ne doit pas être nulle lors de l'appel à cette fonction
 */
/*****************************************
uint64_t hash_hash(const char *key)
{
    uint64_t hash = 5381;
    uint8_t c = *key;
    while ((c = *key++)) {
        hash = ((hash << 5) + hash) ^ c;
    }

    return hash;
}
*****************************************/

/* DEBUT DU CONTEXTE
Fonction :
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */

    .text
    .globl hash_hash
    .type  hash_hash, @function
hash_hash:
hash_hash_fin_prologue:
hash_hash_debut_epilogue:
    ret
    .size   hash_hash, .-hash_hash
