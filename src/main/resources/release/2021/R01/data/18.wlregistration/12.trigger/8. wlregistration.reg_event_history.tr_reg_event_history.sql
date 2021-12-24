CREATE TRIGGER tr_reg_event_history
BEFORE INSERT OR UPDATE
ON wlregistration.reg_event_history
FOR EACH ROW
EXECUTE PROCEDURE wlregistration.tr_reg_event_history$reg_event_history();

