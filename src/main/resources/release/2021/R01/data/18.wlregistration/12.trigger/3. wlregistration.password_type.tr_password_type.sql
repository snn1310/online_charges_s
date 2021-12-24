CREATE TRIGGER tr_password_type
BEFORE INSERT OR UPDATE
ON wlregistration.password_type
FOR EACH ROW
EXECUTE PROCEDURE wlregistration.tr_password_type$password_type();

