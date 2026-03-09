DELIMITER ;;

DROP FUNCTION IF EXISTS sf_employee_checkup_id;;

CREATE FUNCTION sf_employee_checkup_id(
  p_user_id INT,
  p_year INT
)
  RETURNS INT DETERMINISTIC
  COMMENT 'user_id 와 year 로 employee_checkup_id 조회'
BEGIN
  DECLARE v_employee_checkup_id INT;

  SET v_employee_checkup_id = (
    SELECT EC.employee_checkup_id
    FROM employee E
      JOIN employee_checkup EC
        ON E.user_id = EC.user_id
      JOIN company_checkup CC
        ON EC.company_checkup_id = CC.company_checkup_id AND CC.checkup_year = p_year
    WHERE E.user_id = p_user_id
  );

  RETURN v_employee_checkup_id;
END;;

DELIMITER ;
