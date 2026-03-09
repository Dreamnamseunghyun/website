DELIMITER ;;

DROP FUNCTION IF EXISTS sf_hospital_name;;

CREATE FUNCTION sf_hospital_name(
  p_hospital_id INT
)
  RETURNS VARCHAR(50) DETERMINISTIC
  COMMENT 'hospital_id 로 hospital_name 조회'
BEGIN
  DECLARE v_hospital_name VARCHAR(50);

  SET v_hospital_name = (
    SELECT hospital_name
    FROM hospital
    WHERE hospital_id = p_hospital_id
  );

  RETURN v_hospital_name;
END;;

DELIMITER ;
