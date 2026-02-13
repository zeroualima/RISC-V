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
    hash_hash : feuille
Contexte :
    key : registre a0
    # hash : registre t0
    # c : registre t1
FIN DU CONTEXTE */

    .text
    .globl hash_hash
    .type  hash_hash, @function
hash_hash:
hash_hash_fin_prologue:
    li t0, 5381
    lbu t1, 0*8(a0) # uint8_t c = *key;
while:
# ATTENTION : *key++ is parsed as *(key++), but it means, derefrence the old pointer, then advance it
# In brief : c will contain *key, but key will become key++
# ATTENTION : the condition (c = *key++) is equivalent to ((c = *key++) != 0)
    lbu t1, 0*8(a0) # t1 = *key
    addi a0, a0, 8 # a0 = key++
    beqz t1, fin_while
    slli t2, t0, 5 # t2 = hash << 5
    add t2, t2, t0 # t2 = ((hash << 5) + hash)
    xor t0, t2, t1 # hash = ((hash << 5) + hash) ^ c;
    j while
fin_while:
    mv a0, t0
hash_hash_debut_epilogue:
    ret
    .size   hash_hash, .-hash_hash
