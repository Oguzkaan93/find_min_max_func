\echo Use "CREATE EXTENSION find_min_max" to load this file. \quit

CREATE or replace FUNCTION find_min_and_max_func(point, bigint) RETURNS point AS '$libdir/find_min_max_func.so', 'minmax' LANGUAGE C STRICT ;

CREATE or replace FUNCTION find_min_and_max_final_func(
    state point
) RETURNS varchar
LANGUAGE plpgsql
STRICT
AS $$
begin
return cast(state[0] as varchar) || ' -> ' || cast(state[1] as varchar) ;
END;
$$;

CREATE or replace AGGREGATE find_min_and_max(bigint)
(
    SFUNC    = find_min_and_max_func, -- State function
    STYPE    = point,       -- State type
    FINALFUNC = find_min_and_max_final_func,
    initcond = '(0,0)'
);
