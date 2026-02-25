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
    hash_delete : non feuille
Contexte :
    # ra : pile *(sp+32)
    key : registre a1; pile *(sp+24)
    h : registre a0; pile *(sp+16)
    # e : pile *(sp+8) 
    # data : pile *(sp+0)
FIN DU CONTEXTE */

    .globl hash_delete
    .type  hash_delete, @function
hash_delete:
    addi sp, sp, -5*8
    sd a0, 2*8(sp)
    sd a1, 3*8(sp)
    sd ra, 4*8(sp)
hash_delete_fin_prologue:
    mv a0, a1
    jal hash_hash # a0 = hash_hash(key)
    ld t0, 2*8(sp) # t0 = h
    ld t1, 0*8(t0) # t0 = h->n
    remu t1, a0, t0 # t0 = hash_hash(key) % h->n
    
    ld t2, 0*8(t0) # t2 = h->table
    slli t1, t1, 3
    add t2, t2, t1 # t2 = &h->table[index] = h->table + 8 * index
    sd t2, 1*8(sp) # store e

while:
    ld t2, 1*8(sp)
    ld t3, 0*8(t2) # t3 = *e 
    beqz t3, fin_while
    ld a0, 3*8(sp) # a0 = key
    ld a1, 1*8(t3) # a1 = (*e)->key
    jal strcmp # a0 = strcmp(key, (*e)->key)
    beqz a0, fin_while
    ld t2, 1*8(sp)
    ld t3, 0*8(t2) # t3 = *e 
    sd t3, 1*8(sp) # e = &ne->next;
    j while
fin_while:
    ld t0, 1*8(sp)
    ld t1, 0*8(t0) # t1 = *ern data;
    bnez t1, else 
    mv a0, zero
    j hash_delete_debut_epilogue
else:
    ld t2, 2*8(t1) # t2 = delete->data
    sd t2, 0*8(sp)
    ld t3, 0*8(t1) # t3 = (*e)->next
    sd t3, 0*8(t0) # *e = (*e)->next;
    mv a0, t1
    jal free # free(delete);
    ld a0, 0*8(sp)
hash_delete_debut_epilogue:
    ld ra, 4*8(sp)
    addi sp, sp, 5*8
    ret
    .size   hash_delete, .-hash_delete
