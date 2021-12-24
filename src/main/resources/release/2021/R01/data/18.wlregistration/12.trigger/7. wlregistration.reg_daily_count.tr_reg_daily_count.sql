CREATE TRIGGER tr_reg_daily_count
BEFORE INSERT OR UPDATE
ON wlregistration.reg_daily_count
FOR EACH ROW
EXECUTE PROCEDURE wlregistration.tr_reg_daily_count$reg_daily_count();

