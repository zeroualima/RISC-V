/*****************************************
entry_t *hash_lookup(htable_t *h, const char *key)
{
    uint64_t index = hash_hash(key) % h->n;
    for (entry_t *e = h->table[index]; e; e = e->next) {
        if (!strcmp(key, e->key)) {
            return e;
        }
    }
    return NULL;
}
*****************************************/

/* DEBUT DU CONTEXTE
Fonction :
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */

    .globl hash_lookup
    .type  hash_lookup, @function
hash_lookup:
hash_lookup_fin_prologue:
hash_lookup_debut_epilogue:
    ret
    .size   hash_lookup, .-hash_lookup
