create table user_details (
id serial primary key,
first_name varchar(20) not null,
last_name varchar(20),
email varchar(40) unique,
password text not null
)

select * from user_details

INSERT INTO user_details (first_name,last_name, email, password) VALUES ('water','ter','water','water')