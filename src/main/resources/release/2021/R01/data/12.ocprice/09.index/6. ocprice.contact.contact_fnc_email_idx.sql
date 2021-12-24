CREATE INDEX contact_fnc_email_idx
ON ocprice.contact
USING BTREE (LOWER(c_email_address) ASC);

