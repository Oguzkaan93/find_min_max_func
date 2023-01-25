# PostgreSQL min_max_extension with C #
1-) Create the files below:

find_min_max_func.c ,
min_max_extension.control ,
Makefile ,
min_max_extension--0.0.1.sql 

2-) type make install
3-) create extension with "CREATE EXTENSION min_max_extension" in postgres, and you are done.

Sample output: SELECT find_min_and_max(var1) FROM (values(5),(12),(1),(-3)) t(var1);
