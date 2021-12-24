ALTER TABLE ocentitlements.ea_contact
ADD CONSTRAINT uc_online_charges_contact_ext UNIQUE (contact_id, business_system_id);

