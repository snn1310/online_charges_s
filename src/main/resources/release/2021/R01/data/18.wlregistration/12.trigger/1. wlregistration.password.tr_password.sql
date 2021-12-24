CREATE TRIGGER tr_password
BEFORE INSERT OR UPDATE
ON wlregistration.password
FOR EACH ROW
EXECUTE PROCEDURE wlregistration.tr_password$password();

