CREATE TRIGGER tr_reg_count
BEFORE INSERT OR UPDATE
ON wlregistration.reg_count
FOR EACH ROW
EXECUTE PROCEDURE wlregistration.tr_reg_count$reg_count();

