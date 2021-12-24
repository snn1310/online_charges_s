CREATE TRIGGER tr_promotion_profile
BEFORE INSERT OR UPDATE
ON wlregistration.promotion_profile
FOR EACH ROW
EXECUTE PROCEDURE wlregistration.tr_promotion_profile$promotion_profile();

