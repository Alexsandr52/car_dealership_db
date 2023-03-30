# select car information from comments
select id, stamp, country_of_use from cars 
	where id in (select car_id from comments);
	
# select info about orders
select
	CONCAT(u.firstname, ' ', u.lastname) as name,
	u.phone,
	u.email,
	u.country,
	p.model,
	p.`type`,
	p.equipment,
	p.price 
	from orders as o
		join `user` as u
			on o.user_id = u.id
		join preference as p
			on o.car_id = p.car_id;

# select messages group by delivered status
select
	CONCAT(u.firstname, ' ', u.lastname) as name,
	u.phone,
	u.email,
	u.country,
	m.is_delivered
	from message as m
		join `user` as u
			on m.user_id = u.id
	order by m.is_delivered;


	 
	
	
