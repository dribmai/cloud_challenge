# What is average age of the students?
select avg(age) from dareit.students s;
--> answer 30.38

# What is average age of the students in the class?
select class_id, round(avg(age),2) as avg_age
from  dareit.students s 
group by class_id
order by class_id;
