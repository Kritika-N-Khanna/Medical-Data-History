
-- MEDICAL DATA HISTORY PROJECT QUERIES


 -- 1. Show first name, last name, and gender of patients who's gender is 'M'
select first_name,last_name,gender from patients where gender = 'M';

-- 2. Show first name and last name of patients who does not have allergies.
select first_name,last_name from patients where allergies is null;

-- 3. Show first name of patients that start with the letter 'C'
select first_name from patients where first_name like 'C%';

-- 4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
select first_name, last_name from patients where weight between 100 and 120;

-- 5. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
update patients
set allergies = 'NKA'
where allergies is null;

-- 6. Show first name and last name concatenated into one column to show their full name.
select concat(first_name, ' ', last_name) as full_name from patients; 

-- 7. Show first name, last name, and the full province name of each patient.
select p.first_name,p.last_name,pr.province_name 
from patients p
join province_names pr on p.province_id = pr.province_id;

-- 8. Show how many patients have a birth_date with 2010 as the birth year.
select count(*) from patients where year(birth_date) = 2010;

-- 9. Show the first_name, last_name, and height of the patient with the greatest height.
select first_name, last_name, height 
from patients
where height = (select max(height) from patients);

-- 10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
select * from patients where patient_id in(1,45,534,879,1000);

-- 11. Show the total number of admissions
select count(*) from admissions;

-- 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
select * from admissions where admission_date = discharge_date;

-- 13. Show the total number of admissions for patient_id 579.
select count(*) from admissions where patient_id = 579;

-- 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
select distinct(city) from patients where province_id = 'NS'; 

-- 15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
select first_name, last_name, birth_date from patients where height>160 and weight>70;

-- 16. Show unique birth years from patients and order them by ascending.
select distinct year(birth_date) from patients order by year(birth_date);

-- 17. Show unique first names from the patients table which only occurs once in the list.
select first_name from patients 
group by first_name
having count(*) = 1;

-- 18. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
select patient_id, first_name from patients 
where first_name like 's%s' and length(first_name) >= 6;

-- 19. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.   Primary diagnosis is stored in the admissions table.
select p.patient_id, p.first_name, p.last_name 
from patients p
join admissions adm on p.patient_id = adm.patient_id
where adm.diagnosis = 'Dementia';

-- 20. Display every patient's first_name. Order the list by the length of each name and then by alphbetically.
select first_name from patients order by length(first_name), first_name;

-- 21. Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.
select 
count(case when gender='M' then 1 end) as male_count, 
count(case when gender='F' then 1 end) as female_count 
from patients;

-- 22. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
select patient_id, diagnosis from admissions
group by patient_id, diagnosis 
having count(*) >1;

-- 23. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
select city, count(patient_id) as total_patients
from patients
group by city
order by total_patients desc, city asc;

-- 24. Show first name, last name and role of every person that is either patient or doctor. The roles are either "Patient" or "Doctor"
select first_name, last_name, 'Patient' as role from patients
union
select first_name, last_name, 'Doctor' as role from doctors;

-- 25. Show all allergies ordered by popularity. Remove NULL values from query.
select allergies, count(*) as total from patients 
where allergies is not null
group by allergies
order by total desc;

-- 26. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
select first_name,last_name,birth_date from patients 
where birth_date between '1970-01-01' and '1979-12-01'
order by birth_date;

/*27. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. 
Separate the last_name and first_name with a comma. Order the list by the first_name in decending order    EX: SMITH,jane*/
select concat(upper(last_name) , ',' , lower(first_name)) as full_name from patients
order by first_name desc;

-- 28. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
select province_id, sum(height) from patients
group by province_id 
having sum(height) >= 7000;

-- 29. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
select (max(weight) - min(weight)) as difference from patients where last_name = 'Maroni';

-- 30. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
select day(admission_date) as days_of_month, count(*) as total_admissions from admissions
group by days_of_month
order by total_admissions desc;

-- 31. Show all of the patients grouped into weight groups. Show the total amount of patients in each weight group. Order the list by the weight group decending. 
select floor(weight/10)*10 as 'weight_group', count(*) from patients
group by weight_group
order by weight_group desc;

/*32. Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1. 
Obese is defined as weight(kg)/(height(m). Weight is in units kg. Height is in units cm.*/
select patient_id, weight,height, 
case when weight / power(height / 100.0, 2) >= 30 then 1
else 0
end as isObese
from patients;

/*33. Show patient_id, first_name, last_name, and attending doctor's specialty. 
Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'. */
select p.patient_id, p.first_name, p.last_name, d.specialty
from patients p
join admissions adm on p.patient_id = adm.patient_id
join doctors d on adm.attending_doctor_id = d.doctor_id
where adm.diagnosis = 'Epilepsy' and d.first_name = 'Lisa';

/*34. All patients who have gone through admissions, can see their medical documents on our site. 
Those patients are given a temporary password after their first admission. Show the patient_id and temp_password.

   The password must be the following, in order:
    - patient_id
    - the numerical length of patient's last_name
    - year of patient's birth_date*/
    
    select distinct
    p.patient_id, concat(p.patient_id, length(p.last_name),year(p.birth_date)) as password 
    from patients p
    join admissions adm on p.patient_id = adm.patient_id;


-- 35. Change the column name attending_doctor_id to doctor_id of table admission 
alter table admissions 
change attending_doctor_id doctor_id int(11);

