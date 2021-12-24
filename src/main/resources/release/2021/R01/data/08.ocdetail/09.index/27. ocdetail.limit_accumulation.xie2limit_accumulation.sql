CREATE INDEX xie2limit_accumulation
ON ocdetail.limit_accumulation
USING BTREE (la_level_value ASC, la_domain ASC, la_end_date ASC);

