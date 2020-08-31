CREATE OR REPLACE FUNCTION get_tranche_by_country (country_param varchar) 
	RETURNS TABLE (
		country varchar,
		density int,
		tranche varchar
	)
	LANGUAGE plpgsql
AS $$
BEGIN
	RETURN QUERY 
		SELECT
			c.country,
			c.density,
			get_tranche(c.density) as tranche
		FROM country c
		WHERE lower(c.country) like lower(country_param);
		
END;$$;