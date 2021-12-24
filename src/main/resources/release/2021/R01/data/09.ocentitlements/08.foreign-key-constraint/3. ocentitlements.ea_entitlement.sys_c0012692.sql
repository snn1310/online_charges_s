ALTER TABLE ocentitlements.ea_entitlement
ADD FOREIGN KEY (contact_table_id) 
REFERENCES ocentitlements.ea_contact (contact_table_id)
ON DELETE NO ACTION;

