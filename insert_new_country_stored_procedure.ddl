create procedure insert_new_country(name_country varchar)
	language plpgsql
	as $$
	declare
		population int := (SELECT floor(random() * 10000000 + 20000000)::int);
		yearly_change NUMERIC(10,2) := (SELECT (random() * 3 + -1)::NUMERIC(10,2));
		net_change int := (SELECT floor(random() * 15000000 + -500000)::int);
		density int := (SELECT floor(random() * 320 + 20)::int);
		land_area int := (SELECT floor(random() * 20000000 + 200000)::int);
		migrants int := (SELECT floor(random() * 10000 + -5000)::int);
		fert_rate NUMERIC(10,2) := (SELECT (random() * 5 + 1)::NUMERIC(10,1));
		med_age int := (SELECT floor(random() * 10 + 25)::int);
		urban_pop int := (SELECT floor(random() * 70 + 30)::int);
		world_share NUMERIC(10,2) := (SELECT (random() * 2 + 0)::NUMERIC(10,2));
	begin
		INSERT INTO country(country,
							  population,
							  yearly_change,
							  net_change,
							  density,
							  land_area,
							  migrants,
							  fert_rate,
							  med_age,
							  urban_pop,
							  world_share
							 ) 
		VALUES (name_country,
				population,
				yearly_change,
				net_change,
				density,
				land_area,
				migrants,
				fert_rate,
				med_age,
				urban_pop,
				world_share
			   );
	end; 