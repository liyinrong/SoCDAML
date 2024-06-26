////// Compile this file only for the device /////
#ifdef __HERO_1

/////////////////////////////////
//          KERNELS            //
/////////////////////////////////

#define CORES 8

void dev_matvec(uint32_t x_out_phys, uint32_t w_phys, uint32_t x_phys, uint32_t n, uint32_t d) {

    // Verify we don't receive nullptrs
    if (!n || !d || !x_out_phys || !x_phys || !w_phys)
        goto omp_exit;

    // Veirfy the input and output data are in device memory
    if(dev_check_transfer(x_out_phys, x_phys, n*d))
        goto omp_exit;

    // Allocate buffers to hold x (vector) and up to 8 rows
    __device uint32_t *x_l1;
    x_l1 = (__device uint32_t *) snrt_l1alloc(n * sizeof(uint32_t));
    __device uint32_t *w_row_l1_copy, *w_row_l1_comp, *w_row_l1_1, *w_row_l1_2, *w_row_l1_swp;
    w_row_l1_1 = (__device uint32_t *) snrt_l1alloc(CORES * n * sizeof(uint32_t));
    w_row_l1_2 = (__device uint32_t *) snrt_l1alloc(CORES * n * sizeof(uint32_t));
    // Copy the vector locally
    dev_dma_memcpy(x_l1, (const __device void*)x_phys, n * sizeof(uint32_t));
    dm_wait();

    int it = 0;

    // Loop over the rows
    // TODO (0) loop over 8 rows at the time
    for (int I = 0; I < d; I += CORES) {
        int rows_left = d - I;
        
        // Copy the newt row
        // TODO (1) copy more than one row
        // Note: Attention not to go outside of the input buffer
        int rows_todo = rows_left < CORES ? rows_left : CORES;
        if(I == 0)
        {
            dev_dma_memcpy(w_row_l1_1, (__device void*)(w_phys + n * sizeof(uint32_t) * I), rows_todo * n * sizeof(uint32_t));
            w_row_l1_copy = w_row_l1_2;
            w_row_l1_comp = w_row_l1_1;
        }
        dm_wait();
        int rows_tocopy = rows_left - CORES < 8 ? rows_left - CORES : 8;
        if(rows_tocopy > 0)
        {
            dev_dma_memcpy(w_row_l1_copy, (__device void*)(w_phys + n * sizeof(uint32_t) * (I + CORES)), rows_tocopy * n * sizeof(uint32_t));
        }

        // TODO (2) parallelize over the cores
        #pragma omp parallel
        {
            // TODO (3) make sure we don't go outside of the output buffer
            if(snrt_cluster_core_idx() >= rows_todo)
                goto end;

            uint32_t val = 0.0f;

            // Compute the dotproduct
            for (int j = 0; j < n; j++) {
                val += x_l1[j] * w_row_l1_comp[j + snrt_cluster_core_idx() * n];
            }
            // Store the result
            ((uint32_t *)x_out_phys)[I + snrt_cluster_core_idx()] = val;
            end:;
        }
        w_row_l1_swp = w_row_l1_comp;
        w_row_l1_comp = w_row_l1_copy;
        w_row_l1_copy = w_row_l1_swp;
    }
    omp_exit: ;
}

#endif
