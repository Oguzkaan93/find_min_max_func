CREATE or replace FUNCTION find_min_and_max_func(
    state point,
    next  integer
) RETURNS point
LANGUAGE plpgsql
STRICT
AS $$
declare
min_val integer;  
max_val integer;                   
begin    
if state[0] <= next then min_val := state[0];  
elsif next < state[0] then min_val := next;  
end if;
if state[1] >= next then max_val := state[1];  
elsif next > state[1] then max_val := next;  
end if;               
return point(min_val, max_val) ;                     
END;
$$;

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
    initcond = '(1231231232131,0)'
);

## Sample Query ##
SELECT find_min_and_max(var1) FROM FROM (values(5),(12),(1),(-3)) t(var1);