SELECT user_id
     , company_id
     , employee_code
     , AES_DECRYPT(UNHEX(employee_name), 'volk_sitebuilder.co.kr!') AS employee_name
     , no_use
     , employee_no
     , myself
     , birth
     , sex
     , email
     , mobile
     , zipcode
     , address1
     , address2
     , depart
     , title
     , created_at
     , created_user_id
     , updated_at
     , updated_user_id
     , deleted_at
     , deleted_user_id
FROM employee
WHERE employee_name = HEX(AES_ENCRYPT('강호동', 'volk_sitebuilder.co.kr!'))
-- recommended
-- WHERE AES_DECRYPT(UNHEX(employee_name), 'volk_sitebuilder.co.kr!') = '강호동'
