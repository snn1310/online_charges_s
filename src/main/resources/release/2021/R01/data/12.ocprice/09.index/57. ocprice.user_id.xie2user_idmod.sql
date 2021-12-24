CREATE INDEX xie2user_idmod
ON ocprice.user_id
USING BTREE (ui_user_id ASC, ui_eff_date ASC, ui_end_date ASC, ui_domain ASC);

