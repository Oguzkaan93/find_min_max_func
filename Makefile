EXTENSION = min_max_extension # the extension name
DATA = min_max_extension--0.0.1.sql  # script files to install
MODULES = find_min_max_func

#postgres build stuff
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
