CREATE TRIGGER tr_threshold_notify
BEFORE INSERT OR UPDATE
ON wlregistration.threshold_notify
FOR EACH ROW
EXECUTE PROCEDURE wlregistration.tr_threshold_notify$threshold_notify();

