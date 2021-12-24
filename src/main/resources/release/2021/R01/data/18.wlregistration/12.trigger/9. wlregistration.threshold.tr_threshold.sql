CREATE TRIGGER tr_threshold
BEFORE INSERT OR UPDATE
ON wlregistration.threshold
FOR EACH ROW
EXECUTE PROCEDURE wlregistration.tr_threshold$threshold();

