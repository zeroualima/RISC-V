/*****************************************
void *hash_delete(htable_t *h, const char *key)
{
    uint64_t index = hash_hash(key) % h->n;
    entry_t **e = &h->table[index];
    while (*e != NULL && strcmp(key, (*e)->key)) {
        entry_t *ne = *e;
        e = &ne->next;
    }
    entry_t *delete = *e;
    if (delete == NULL) {
        return NULL;
    }
    void *data = delete->data;
    *e = (*e)->next;
    free(delete);
    return data;
}
*****************************************/

/* DEBUT DU CONTEXTE
Fonction :
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */

    .globl hash_delete
    .type  hash_delete, @function
hash_delete:
hash_delete_fin_prologue:
hash_delete_debut_epilogue:
    ret
    .size   hash_delete, .-hash_delete
