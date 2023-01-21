#include<stdio.h>
#include "postgres.h"
#include "fmgr.h"
#include "utils/geo_decls.h"
PG_MODULE_MAGIC;


PG_FUNCTION_INFO_V1(minmax);

Datum
minmax (PG_FUNCTION_ARGS)
{

        Point *funk =  PG_GETARG_POINT_P(0);
        int64 deger = PG_GETARG_INT64(1);
        int64 funkx = funk->x;
        int64 funky = funk->y;
        if ( funkx ==  0 && funky == 0)
        {
                funkx = deger;
                funky = deger;
        }

        if ( deger < funkx )
        {
                funkx = deger;
        }
        if ( deger > funky )
        {
                funky = deger;
        }

        funk->x = funkx;
        funk->y = funky;
        PG_RETURN_POINT_P(funk);

}
