-- Cars view
CREATE OR REPLACE VIEW cars_view AS
SELECT id, stamp, country_of_origin, country_of_use, year_of_release FROM cars;

create or replace view preference_view as
select c.id, c.stamp, p.model, m.media_type_id
	from cars c 
		left join preference p 
			on c.id = p.car_id 
		left join media m 
			on m.car_id = c.id;
   
CREATE OR REPLACE VIEW users_view AS
select u.id, u.firstname, u.lastname, c.value, c2.stamp
	from `user` u 
		left join comments c 
			on c.user_id = u.id 
		left join cars c2 
		 	on c2.id = c.car_id 