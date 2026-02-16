/*****************************************
void hash_insert(htable_t *h, char *key, void *data)
{
    uint64_t index = hash_hash(key) % h->n;
    entry_t *e = malloc(sizeof *e); # [*e -> entry_t]
    e->next = h->table[index];
    e->key = strdup(key);
    e->data = data;
    h->table[index] = e;
}
*****************************************/

/* DEBUT DU CONTEXTE
Fonction :
    hash_insert : non feuille
Contexte :
    ra : pile *(sp+40)
    h : registre a0; pile *(sp+16)
    key : registre a1; pile *(sp+24)
    data : registre a2; pile *(sp+32)
    # index : registre t2: pile *(sp+0)
    # e : registre t3; pile *(sp+8)
FIN DU CONTEXTE */
    .globl hash_insert
    .type  hash_insert, @function
hash_insert:
    addi sp, sp, -6*8
    sd a0, 2*8(sp)
    sd a1, 3*8(sp)
    sd a2, 4*8(sp)
    sd ra, 5*8(sp)
hash_insert_fin_prologue:
    mv a0, a1 # a0 = key
    jal hash_hash # a0 = hash_hash(key)
    ld t0, 2*8(sp) # t0 = h
    ld t1, 1*8(t0) # t1 = h->n
    remu t2, a0, t1 # uint64_t index = hash_hash(key) % h->n;
    sd t2, 0*8(sp)

    # sizeof entry_t = 3*8 bytes, 3 pointers
    li a0, 3*8
    jal malloc # entry_t *e = malloc(sizeof entry_t);
    sd a0, 1*8(sp) # on stocke &e

    ld a0, 2*8(sp) # a0 = h
    ld a0, 0*8(a0) # a0 = h->table
    ld t2, 0*8(sp) # t2 = index
    slli t0, t0, 8
    add a0, a0, t0 # a0 = h->table + index * 8 = &table[index]
    ld t0, 0*8(a0) # t0 = h->table[index]
    ld t1, 1*8(sp) # t1 = e
    sd t0, 0*8(t1) # e->next = h->table[index];

    ld a0, 3*8(sp) # a0 = key
    jal strdup
    ld t1, 1*8(sp) # t1 = e
    sd a0, 1*8(t1) # e->key = strdup(key);

    ld t0, 4*8(sp) # t0 = data
    ld t1, 1*8(sp) # t1 = e
    sd t0, 2*8(t1) # e->data = data;

    ld a0, 2*8(sp) # a0 = h
    ld t2, 0*8(sp) # t2 = index
    li t0, 8
    mul t2, t2, t0 # t2 = index * 8
    add a0, a0, t2 # a0 = h + index * 8
    ld t1, 1*8(sp) # t1 = e
    sd t1, 0*8(a0) # h->table[index] = e;
hash_insert_debut_epilogue:
    ld ra, 5*8(sp)
    addi sp, sp, 6*8
    ret
    .size   hash_insert, .-hash_insert
