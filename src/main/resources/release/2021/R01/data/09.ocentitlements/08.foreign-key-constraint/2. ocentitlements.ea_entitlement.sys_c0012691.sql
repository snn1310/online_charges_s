ALTER TABLE ocentitlements.ea_entitlement
ADD FOREIGN KEY (entitlement_group_table_id) 
REFERENCES ocentitlements.ea_entitlement_group (entitlement_group_table_id)
ON DELETE NO ACTION;

