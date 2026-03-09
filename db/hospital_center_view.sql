CREATE OR REPLACE VIEW hospital_center_view AS

SELECT hospital.hospital_id
     , hospital.hospital_code
     , hospital.hospital_name
     , hospital.business_no
     , hospital.ci_filename
     , center.center_id
     , center.center_code
     , center.center_name
     , center.head
     , center.telephone
     , center.homepage
     , center.zipcode
     , center.sido
     , center.sigungu
     , center.address1
     , center.address2
     , center.location_desc
     , center.grade
     , center.preday
     , center.able_ct
     , center.able_mri
     , center.able_park
     , center.able_soup
     , center.able_satur
     , center.able_special
     , center.able_am
     , center.receipt_normal_begin
     , center.receipt_normal_end
     , center.receipt_normal_pm_begin
     , center.receipt_normal_pm_end
     , center.receipt_satur_begin
     , center.receipt_satur_end
     , center.notes
     , center.no_use
     , center.advertisement
     , center.center_adv_filename1
     , center.center_adv_filename2
     , center.center_adv_filename3
     , center.center_adv_filename4
     , center.center_adv_filename5
     , center.center_adv_filename6
     , center_count.center_head
     , IF(center_count.center_head > 1, CONCAT(hospital.hospital_name, ' ', center.center_name),
          hospital.hospital_name) hospital_center_name
FROM hospital
       JOIN center ON hospital.hospital_id = center.hospital_id AND center.deleted_at IS NULL
       JOIN (SELECT hospital_id, COUNT(*) center_head
             FROM center
             WHERE deleted_at IS NULL
             GROUP BY hospital_id) center_count ON hospital.hospital_id = center_count.hospital_id
WHERE hospital.deleted_at IS NULL
