DELIMITER ;;

DROP FUNCTION IF EXISTS sf_phone_hyphen;;

CREATE FUNCTION sf_phone_hyphen(
  pno VARCHAR(20)
)
  RETURNS VARCHAR(20)
  COMMENT '전화번호에 하이픈 추가'
BEGIN
  DECLARE result VARCHAR(20);
  DECLARE len INT;

  SET pno = IFNULL(pno, '');
  SET len = LENGTH(pno);

  IF len < 4 THEN
    SET result = pno;
  ELSEIF len < 8 THEN
    SET result = CONCAT(LEFT(pno, len - 4), '-', RIGHT(pno, 4));
  ELSE
    CASE len
      WHEN 8 THEN SET result = CONCAT(LEFT(pno, 4), '-', RIGHT(pno, 4));
      WHEN 9 THEN SET result = CONCAT(LEFT(pno, 2), '-', MID(pno, 3, 3), '-', RIGHT(pno, 4));
      WHEN 10 THEN CASE LEFT(pno, 2)
        WHEN '02' THEN SET result = CONCAT(LEFT(pno, 2), '-', MID(pno, 3, 4), '-', RIGHT(pno, 4));
        ELSE SET result = CONCAT(LEFT(pno, 3), '-', MID(pno, 4, 3), '-', RIGHT(pno, 4));
        END CASE;
      WHEN 11 THEN CASE LEFT(pno, 3)
        WHEN '050' THEN SET result = CONCAT(LEFT(pno, 4), '-', MID(pno, 4, 3), '-', RIGHT(pno, 4));
        ELSE SET result = CONCAT(LEFT(pno, 3), '-', MID(pno, 4, 4), '-', RIGHT(pno, 4));
        END CASE;
      WHEN 12 THEN SET result = CONCAT(LEFT(pno, 4), '-', MID(pno, 4, 4), '-', RIGHT(pno, 4));
      ELSE SET result = pno;
      END CASE;
  END IF;
  RETURN result;

END ;;

DELIMITER ;
