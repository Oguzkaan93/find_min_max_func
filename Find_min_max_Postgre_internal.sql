CREATE or replace FUNCTION find_min_and_max_func(point,integer) RETURNS point AS E'PATH_TO_FILE', 'minmax' LANGUAGE C STRICT ;

CREATE or replace FUNCTION find_min_and_max_final_func(
    state point
) RETURNS varchar
LANGUAGE plpgsql
STRICT
AS $$                 
begin              
return cast(state[0] as varchar) || '->' || cast(state[1] as varchar) ;                     
END;
$$;


CREATE or replace AGGREGATE find_min_and_max(integer)
(
    SFUNC    = find_min_and_max_func, -- State function
    STYPE    = point,       -- State type
    FINALFUNC = find_min_and_max_final_func,
    initcond = '(0,0)'
);

## Sample Query ##
SELECT find_min_and_max(var1) FROM FROM (values(5),(12),(1),(-3)) t(var1);
