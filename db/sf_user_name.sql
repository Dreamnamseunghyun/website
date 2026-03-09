DELIMITER ;;

DROP FUNCTION IF EXISTS sf_user_name;;

CREATE FUNCTION sf_user_name(
  p_user_id VARCHAR(30)
)
  RETURNS VARCHAR(96) DETERMINISTIC
  COMMENT '사용자아이디로 사용자명 조회'
BEGIN
  DECLARE v_user_name VARCHAR(96);

  SET v_user_name = (
    SELECT COALESCE(PM.platform_manager_name, CM.company_manager_name, HM.center_manager_name) AS user_name
    FROM user U
           LEFT JOIN platform_manager PM ON U.user_id = PM.user_id AND U.user_type = 'PM'
           LEFT JOIN company_manager CM ON U.user_id = CM.user_id AND U.user_type = 'CM'
           LEFT JOIN center_manager HM ON U.user_id = HM.user_id AND U.user_type = 'HM'
    WHERE U.user_id = p_user_id
    LIMIT 0, 1
  );

  RETURN v_user_name;
END;;

DELIMITER ;
