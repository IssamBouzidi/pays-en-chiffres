-- Drop table if exists
DROP TABLE IF EXISTS country;

-- Create table country 
CREATE TABLE country(
	id_country    SERIAL PRIMARY KEY,
	country       VARCHAR(50),
	population    INTEGER,
	yearly_change NUMERIC(10,2),
	net_change    INTEGER,
	density       INTEGER,
	land_area     INTEGER,
	migrants      NUMERIC(10,2),
	fert_rate     NUMERIC(10,2),
	med_age       INTEGER,
	urban_pop     INTEGER,
	world_share   NUMERIC(10,2)
);

-- Alter table add column date_insertion
ALTER TABLE country
ADD COLUMN date_insertion TIMESTAMP WITHOUT TIME ZONE;