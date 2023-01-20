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
