#include<stdio.h>
#include "postgres.h"
#include "fmgr.h"
#include <string.h>
#include "utils/geo_decls.h"
PG_MODULE_MAGIC;


PG_FUNCTION_INFO_V1(minmax);

Datum
minmax (PG_FUNCTION_ARGS)
{

        Point *funk =  PG_GETARG_POINT_P(0);
        int deger = PG_GETARG_INT32(1);
        int funkx = funk->x;
        int funky = funk->y;

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
