CREATE TABLE nyct_station_entrance_2011 AS
SELECT DISTINCT 
  Division, Line, Station_Name, Station_Latitude, Station_Longitude, 
  Route_1, Route_2, Route_3, Route_4, Route_5, Route_6, Route_7, 
  Route_8, Route_9, Route_10, Route_11, 
  SetSRID(ST_Point(Station_Longitude, Station_Latitude), 4326) AS geom
FROM StationEntrances

CREATE TABLE geo_nyct_station_multi_2011 AS
SELECT
  Division, Line, Station_Name, Station_Latitude, Station_Longitude, 
  Route_1, Route_2, Route_3, Route_4, Route_5, Route_6, Route_7, 
  Route_8, Route_9, Route_10, Route_11, 
  ST_Multi(ST_Collect(SetSRID(ST_Point(Longitude, Latitude), 4326))) AS geom
FROM nyct_station_entrance_2011
GROUP BY
  Division, Line, Station_Name, Station_Latitude, Station_Longitude, 
  Route_1, Route_2, Route_3, Route_4, Route_5, Route_6, Route_7, 
  Route_8, Route_9, Route_10, Route_11

CREATE VIEW vw_tract_household_income AS
SELECT 
  substr(geoid, 8) AS geoid, b19001001 AS hh_total, 
  b19001002 AS hh_under_10k, b19001003 AS hh_10k_to_15k, 
  b19001004 AS hh_15k_to_20k, b19001005 AS hh_20k_to_25k, 
  b19001006 AS hh_25k_to_30k, b19001007 AS hh_30k_to_35k, 
  b19001008 AS hh_35k_to_40k, b19001009 AS hh_40k_to_45k, 
  b19001010 AS hh_45k_to_50k, b19001011 AS hh_50k_to_60k, 
  b19001012 AS hh_60k_to_75k, b19001013 AS hh_75k_to_100k, 
  b19001014 AS hh_100k_to_125k, b19001015 AS hh_125k_to_150k, 
  b19001016 AS hh_150k_to_200k, b19001017 AS hh_over_200k, 
  b19013001 AS median_hh_income, b19025001 AS aggregate_hh_income 
FROM acs2011_5yr_seq0056 JOIN acs2011_5yr_geoheader USING (stusab, logrecno)
WHERE sumlevel = 140

SELECT
  substr(geoid, 1, 5) AS county_fips, sum(hh_total) AS hh_total,
  sum(hh_under_10k + hh_10k_to_15k + hh_15k_to_20k + hh_20k_to_25k
      + hh_25k_to_30k + hh_30k_to_35k + hh_35k_to_40k + hh_40k_to_45k
      + hh_45k_to_50k) AS hh_under_40k, 
  100.0 * sum(hh_under_10k + hh_10k_to_15k + hh_15k_to_20k + hh_20k_to_25k
      + hh_25k_to_30k + hh_30k_to_35k + hh_35k_to_40k + hh_40k_to_45k
      + hh_45k_to_50k) / sum(hh_total) AS pct_hh_under_40k
FROM vw_tract_household_income
WHERE substr(geoid10, 1, 5) IN ('36005', '36047', '36061', '36081', '36085')
GROUP BY county_fips;

CREATE TABLE geo_nyc_tract_income AS
SELECT 
  PK_UID, STATEFP || COUNTYFP AS county_fips, TRACTCE AS tract, NAME AS name, 
  NAMELSAD AS long_name, i.*, ST_Transform(geom, 2263) AS geom
FROM geo_tract_2011 JOIN vw_tract_household_income i USING (geoid)
WHERE STATEFP || COUNTYFP IN ('36005', '36047', '36061', '36081', '36085');

CREATE VIEW vw_geo_nyc_tract_income AS
SELECT 
  PK_UID, STATEFP || COUNTYFP AS county_fips, TRACTCE AS tract, NAME AS name, 
  NAMELSAD AS long_name, i.*, ST_Transform(geom, 2263) AS geom
FROM geo_tract_2011 JOIN vw_tract_household_income i USING (geoid)
WHERE STATEFP || COUNTYFP IN ('36005', '36047', '36061', '36081', '36085');

SELECT geoid, ST_Area(geom) FROM geo_nyc_tract_income;

CREATE VIEW vw_geo_nyct_station_2011 AS
SELECT 
  ROWID, Division, Line, Station_Name, Station_Latitude, Station_Longitude, 
  Route_1, Route_2, Route_3, Route_4, Route_5, Route_6, Route_7, Route_8, 
  Route_9, Route_10, Route_11, ST_Transform(geom, 2263) AS geom
FROM geo_nyct_station_2011;

INSERT INTO views_geometry_columns
VALUES ('vw_geo_nyct_station_2011', 'geom', 'rowid', 'geo_nyct_station_2011', 'geom', 1);

SELECT station_name, route_1, route_2, long_name, median_hh_income
FROM vw_geo_nyct_station_2011 s JOIN geo_nyc_tract_income t
  ON (ST_Within(s.geom, t.geom));

SELECT rowid, station_name, ST_Buffer(geom, 1320) AS geom
FROM geo_nyct_station_median_hh_income;

SELECT station_name, sum(aggregate_hh_income) / sum(hh_total) AS avg_hh_income
FROM geo_nyc_tract_income t JOIN geo_nyct_station_median_hh_income s
  ON (PtDistWithin(t.geom, s.geom, 1320))
GROUP BY station_name;

SELECT station_name, ST_Intersection(t.geom, ST_Buffer(s.geom, 1320)) AS geom
FROM geo_nyc_tract_income t JOIN geo_nyct_station_median_hh_income s
  ON (PtDistWithin(t.geom, s.geom, 1320));

SELECT station_name, ST_Area(t.geom) AS area_total, 
  ST_Area(ST_Intersection(t.geom, ST_Buffer(s.geom, 1320))) AS area_intersection,
  aggregate_hh_income, hh_total
FROM geo_nyc_tract_income t JOIN geo_nyct_station_median_hh_income s
  ON (PtDistWithin(t.geom, s.geom, 1320));

SELECT 
  station_name,
  sum(aggregate_hh_income * area_intersection / area_total)
    / sum(hh_total * area_intersection / area_total) AS avg_income
FROM (
  SELECT station_name, ST_Area(t.geom) AS area_total, 
    ST_Area(ST_Intersection(t.geom, ST_Buffer(s.geom, 1320))) AS area_intersection,
    aggregate_hh_income, hh_total
  FROM geo_nyc_tract_income t JOIN geo_nyct_station_median_hh_income s
    ON (PtDistWithin(t.geom, s.geom, 1320))
  ) a
GROUP BY station_name;

