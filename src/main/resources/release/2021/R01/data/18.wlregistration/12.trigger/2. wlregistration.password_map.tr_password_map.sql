CREATE TRIGGER tr_password_map
BEFORE INSERT OR UPDATE
ON wlregistration.password_map
FOR EACH ROW
EXECUTE PROCEDURE wlregistration.tr_password_map$password_map();

