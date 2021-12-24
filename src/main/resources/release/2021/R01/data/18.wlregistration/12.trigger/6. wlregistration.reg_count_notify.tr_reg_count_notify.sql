CREATE TRIGGER tr_reg_count_notify
BEFORE INSERT OR UPDATE
ON wlregistration.reg_count_notify
FOR EACH ROW
EXECUTE PROCEDURE wlregistration.tr_reg_count_notify$reg_count_notify();

