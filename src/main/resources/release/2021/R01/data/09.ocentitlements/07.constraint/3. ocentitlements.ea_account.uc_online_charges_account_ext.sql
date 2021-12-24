ALTER TABLE ocentitlements.ea_account
ADD CONSTRAINT uc_online_charges_account_ext UNIQUE (account_id, business_system_id);

