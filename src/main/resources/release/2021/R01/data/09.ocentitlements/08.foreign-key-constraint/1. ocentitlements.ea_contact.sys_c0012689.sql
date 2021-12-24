ALTER TABLE ocentitlements.ea_contact
ADD FOREIGN KEY (account_table_id) 
REFERENCES ocentitlements.ea_account (account_table_id)
ON DELETE NO ACTION;

