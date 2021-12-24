ALTER TABLE ocprice.override_billing_option
ADD CONSTRAINT xpkoverride_billing_option PRIMARY KEY (obo_domain, obo_pricing_service_type, obo_billing_method, obo_database_name, obo_usage_type, obo_access_method, obo_sub_usage_type, obo_price_id, obo_effective_date);

