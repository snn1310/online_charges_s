CREATE INDEX contact_fnc_name_idx
ON ocprice.contact
USING BTREE (LOWER(c_last_name) ASC);

