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
    hash_lookup : non feuille
Contexte :
    h : registre a0; pile *(sp+8)
    key : registre a1; pile *(sp+16)
    ra : pile *(sp+24)
    e : registre t0; pile *(sp+0)
FIN DU CONTEXTE */

    .globl hash_lookup
    .type  hash_lookup, @function
hash_lookup:
    addi sp, sp, -4*8
    sd a0, 1*8(sp)
    sd a1, 2*8(sp)
    sd ra, 3*8(sp)
hash_lookup_fin_prologue:
    ld a0, 2*8(sp) # a0 = key
    jal hash_hash # a0 = hash_hash(key)
    ld t1, 1*8(sp) # t1 = h
    ld t2, 1*8(t1) # t2 = h->n
    remu a0, a0, t2 # a0 = hash_hash(key) % h->n

    ld t1, 0*8(t1) # t1 = h->table
    slli t2, a0, 3 # t2 = index * 8
    add t1, t1, t2 # t1 = h->table + index * 8

    ld t0, 0*8(t1) # t3 = entry_t * = h->table[index]
    sd t0, 0*8(sp) # store e
for:
    beqz t0, fin_for
    ld a0, 2*8(sp) # a0 = key
    ld a1, 1*8(t0) # a1 = e->key
    jal strcmp # a0 = strcmp(key, e->key)
    ld t0, 0*8(sp) # t0 = e
    beqz a0, if
    ld t0, 0*8(t0) # e = e->next
fin_for:
    mv a0, zero
    j hash_lookup_debut_epilogue
if:
    mv a0, t0
    j hash_lookup_debut_epilogue
hash_lookup_debut_epilogue:
    ld ra, 3*8(sp)
    addi sp, sp, 4*8
    ret
    .size   hash_lookup, .-hash_lookup
