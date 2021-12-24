ALTER TABLE ocprice.currency_code
ADD CONSTRAINT xpkcurrency_code PRIMARY KEY (cc_company_code, cc_currency_code, cc_eff_date);

