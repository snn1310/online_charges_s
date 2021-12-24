CREATE TRIGGER tr_customer_contact
BEFORE INSERT OR UPDATE
ON wlregistration.customer_contact
FOR EACH ROW
EXECUTE PROCEDURE wlregistration.tr_customer_contact$customer_contact();

