/*
-- Copyright (c) 2016 Synopsys, Inc. This Synopsys software and all associated
-- documentation are proprietary to Synopsys, Inc. and may only be used
-- pursuant to the terms and conditions of a written license agreement with
-- Synopsys, Inc.  All other use, reproduction, modification, or distribution
-- of the Synopsys software or the associated documentation is strictly
-- prohibited.
*/

#include "dwords_longlong.h"

#define __ashrdi3 __sra_i64

#include <ashrdi3.c>
