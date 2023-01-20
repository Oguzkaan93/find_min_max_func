# find_min_max_func

1-) compile minmax.c
2-) Create find_min_and_max_func with below code.
CREATE or replace FUNCTION find_min_and_max_func(point,integer) RETURNS point AS E'Path_To_Compiled_minmax.c', 'minmax' LANGUAGE C STRICT ;
2-) Create find_min_and_max_final_func in PostgreSQL with find_min_and_max_final_func file.
3-) Create find_min_and_max with find_min_and_max_final_func file.

Example Query to run -> SELECT find_min_and_max(var1) FROM (values(5),(12),(1),(-3)) t(var1);
