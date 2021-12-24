ALTER TABLE ocentitlements.ea_entitlement_group
ADD CONSTRAINT uc_online_charges_group UNIQUE (entitlement_group_id, business_system_id);

