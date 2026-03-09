DELIMITER ;;

DROP FUNCTION IF EXISTS BIN_TO_UUID;;

CREATE FUNCTION BIN_TO_UUID(
  p_bin BINARY(16)
)
  RETURNS VARCHAR(36) DETERMINISTIC
  COMMENT 'BINARY 형태의 UUID를 VARCHAR 형태로 변환'
BEGIN
  DECLARE v_temp VARCHAR(32);
  DECLARE v_uuid VARCHAR(36);

  SET v_temp = HEX(p_bin);
  SET v_uuid = CONCAT_WS('-', SUBSTR(v_temp, 1, 8), SUBSTR(v_temp, 9, 4), SUBSTR(v_temp, 13, 4), SUBSTR(v_temp, 17, 4),
                         SUBSTR(v_temp, 21, 12));

  RETURN v_uuid;
END;;

DELIMITER ;
