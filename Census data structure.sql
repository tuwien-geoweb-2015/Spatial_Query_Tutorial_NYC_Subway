--Import g20115ny.csv

CREATE TABLE acs2011_5yr_geoheader
(
  fileid character varying(6), -- Always equal to ACS Summary File identification
  stusab character varying(2) NOT NULL, -- State Postal Abbreviation
  sumlevel integer, -- Summary Level
  component character varying(2), -- Geographic Component
  logrecno integer NOT NULL, -- Logical Record Number
  us character varying(1), -- US
  region character varying(1), -- Census Region
  division character varying(1), -- Census Division
  statece character varying(2), -- State (Census Code)
  state character varying(2), -- State (FIPS Code)
  county character varying(3), -- County of current residence
  cousub character varying(5), -- County Subdivision (FIPS)
  place character varying(5), -- Place (FIPS Code)
  tract character varying(6), -- Census Tract
  blkgrp character varying(1), -- Block Group
  concit character varying(5), -- Consolidated City
  aianhh character varying(4), -- American Indian Area/Alaska Native Area/ Hawaiian Home Land (Census)
  aianhhfp character varying(5), -- American Indian Area/Alaska Native Area/ Hawaiian Home Land (FIPS)
  aihhtli character varying(1), -- American Indian Trust Land/ Hawaiian Home Land Indicator
  aitsce character varying(3), -- American Indian Tribal Subdivision (Census)
  aits character varying(5), -- American Indian Tribal Subdivision (FIPS)
  anrc character varying(5), -- Alaska Native Regional Corporation (FIPS)
  cbsa character varying(5), -- Metropolitan and Micropolitan Statistical Area
  csa character varying(3), -- Combined Statistical Area
  metdiv character varying(5), -- Metropolitan Statistical Area-Metropolitan Division
  macc character varying(1), -- Metropolitan Area Central City
  memi character varying(1), -- Metropolitan/Micropolitan Indicator Flag
  necta character varying(5), -- New England City and Town Area
  cnecta character varying(3), -- New England City and Town Combined Statistical Area
  nectadiv character varying(5), -- New England City and Town Area Division
  ua character varying(5), -- Urban Area
  blank1 character varying(5), -- Reserved for future use
  cdcurr character varying(2), -- Current Congressional District ***
  sldu character varying(3), -- State Legislative District Upper
  sldl character varying(3), -- State Legislative District Lower
  blank2 character varying(6), -- Reserved for future use
  blank3 character varying(3), -- Reserved for future use
  zcta5 character varying(5), -- 5-digit ZIP Code Tabulation Area
  submcd character varying(5), -- Subminor Civil Division (FIPS)
  sdelm character varying(5), -- State-School District (Elementary)
  sdsec character varying(5), -- State-School District (Secondary)
  sduni character varying(5), -- State-School District (Unified)
  ur character varying(1), -- Urban/Rural
  pci character varying(1), -- Principal City Indicator
  blank5 character varying(6), -- Reserved for future use
  blank6 character varying(5), -- Reserved for future use
  puma5 character varying(5), -- Public Use Microdata Area - 5% File
  blank7 character varying(5), -- Reserved for future use
  geoid character varying(40), -- Geographic Identifier
  name character varying(1000), -- Area Name
  bttr character varying(6), -- Tribal Tract
  btbg character varying(1), -- Tribal Block Group
  blank8 character varying(44), -- Reserved for future use
  CONSTRAINT geoheader_pkey PRIMARY KEY (stusab , logrecno )
)


INSERT INTO acs2011_5yr_geoheader
SELECT "COL001", "COL002", "COL003", "COL004", "COL005", "COL006", "COL007", "COL008", "COL009", "COL010", "COL011", "COL012", "COL013", "COL014", "COL015", "COL016", "COL017", "COL018", "COL019", "COL020", "COL021", "COL022", "COL023", "COL024", "COL025", "COL026", "COL027", "COL028", "COL029", "COL030", "COL031", "COL032", "COL033", "COL034", "COL035", "COL036", "COL037", "COL038", "COL039", "COL040", "COL041", "COL042", "COL043", "COL044", "COL045", "COL046", "COL047", "COL048", "COL049", "COL050", "COL051", "COL052", "COL053"
FROM "g20115ny"

--Import e20115ny0056000

CREATE TABLE acs2011_5yr_seq0056
(
  fileid character varying(6),
  filetype character varying(6),
  stusab character varying(2) NOT NULL,
  chariter character varying(3),
  seq character varying(4),
  logrecno integer NOT NULL,
  b19001001 double precision,
  b19001002 double precision,
  b19001003 double precision,
  b19001004 double precision,
  b19001005 double precision,
  b19001006 double precision,
  b19001007 double precision,
  b19001008 double precision,
  b19001009 double precision,
  b19001010 double precision,
  b19001011 double precision,
  b19001012 double precision,
  b19001013 double precision,
  b19001014 double precision,
  b19001015 double precision,
  b19001016 double precision,
  b19001017 double precision,
  b19001a001 double precision,
  b19001a002 double precision,
  b19001a003 double precision,
  b19001a004 double precision,
  b19001a005 double precision,
  b19001a006 double precision,
  b19001a007 double precision,
  b19001a008 double precision,
  b19001a009 double precision,
  b19001a010 double precision,
  b19001a011 double precision,
  b19001a012 double precision,
  b19001a013 double precision,
  b19001a014 double precision,
  b19001a015 double precision,
  b19001a016 double precision,
  b19001a017 double precision,
  b19001b001 double precision,
  b19001b002 double precision,
  b19001b003 double precision,
  b19001b004 double precision,
  b19001b005 double precision,
  b19001b006 double precision,
  b19001b007 double precision,
  b19001b008 double precision,
  b19001b009 double precision,
  b19001b010 double precision,
  b19001b011 double precision,
  b19001b012 double precision,
  b19001b013 double precision,
  b19001b014 double precision,
  b19001b015 double precision,
  b19001b016 double precision,
  b19001b017 double precision,
  b19001c001 double precision,
  b19001c002 double precision,
  b19001c003 double precision,
  b19001c004 double precision,
  b19001c005 double precision,
  b19001c006 double precision,
  b19001c007 double precision,
  b19001c008 double precision,
  b19001c009 double precision,
  b19001c010 double precision,
  b19001c011 double precision,
  b19001c012 double precision,
  b19001c013 double precision,
  b19001c014 double precision,
  b19001c015 double precision,
  b19001c016 double precision,
  b19001c017 double precision,
  b19001d001 double precision,
  b19001d002 double precision,
  b19001d003 double precision,
  b19001d004 double precision,
  b19001d005 double precision,
  b19001d006 double precision,
  b19001d007 double precision,
  b19001d008 double precision,
  b19001d009 double precision,
  b19001d010 double precision,
  b19001d011 double precision,
  b19001d012 double precision,
  b19001d013 double precision,
  b19001d014 double precision,
  b19001d015 double precision,
  b19001d016 double precision,
  b19001d017 double precision,
  b19001e001 double precision,
  b19001e002 double precision,
  b19001e003 double precision,
  b19001e004 double precision,
  b19001e005 double precision,
  b19001e006 double precision,
  b19001e007 double precision,
  b19001e008 double precision,
  b19001e009 double precision,
  b19001e010 double precision,
  b19001e011 double precision,
  b19001e012 double precision,
  b19001e013 double precision,
  b19001e014 double precision,
  b19001e015 double precision,
  b19001e016 double precision,
  b19001e017 double precision,
  b19001f001 double precision,
  b19001f002 double precision,
  b19001f003 double precision,
  b19001f004 double precision,
  b19001f005 double precision,
  b19001f006 double precision,
  b19001f007 double precision,
  b19001f008 double precision,
  b19001f009 double precision,
  b19001f010 double precision,
  b19001f011 double precision,
  b19001f012 double precision,
  b19001f013 double precision,
  b19001f014 double precision,
  b19001f015 double precision,
  b19001f016 double precision,
  b19001f017 double precision,
  b19001g001 double precision,
  b19001g002 double precision,
  b19001g003 double precision,
  b19001g004 double precision,
  b19001g005 double precision,
  b19001g006 double precision,
  b19001g007 double precision,
  b19001g008 double precision,
  b19001g009 double precision,
  b19001g010 double precision,
  b19001g011 double precision,
  b19001g012 double precision,
  b19001g013 double precision,
  b19001g014 double precision,
  b19001g015 double precision,
  b19001g016 double precision,
  b19001g017 double precision,
  b19001h001 double precision,
  b19001h002 double precision,
  b19001h003 double precision,
  b19001h004 double precision,
  b19001h005 double precision,
  b19001h006 double precision,
  b19001h007 double precision,
  b19001h008 double precision,
  b19001h009 double precision,
  b19001h010 double precision,
  b19001h011 double precision,
  b19001h012 double precision,
  b19001h013 double precision,
  b19001h014 double precision,
  b19001h015 double precision,
  b19001h016 double precision,
  b19001h017 double precision,
  b19001i001 double precision,
  b19001i002 double precision,
  b19001i003 double precision,
  b19001i004 double precision,
  b19001i005 double precision,
  b19001i006 double precision,
  b19001i007 double precision,
  b19001i008 double precision,
  b19001i009 double precision,
  b19001i010 double precision,
  b19001i011 double precision,
  b19001i012 double precision,
  b19001i013 double precision,
  b19001i014 double precision,
  b19001i015 double precision,
  b19001i016 double precision,
  b19001i017 double precision,
  b19013001 double precision,
  b19013a001 double precision,
  b19013b001 double precision,
  b19013c001 double precision,
  b19013d001 double precision,
  b19013e001 double precision,
  b19013f001 double precision,
  b19013g001 double precision,
  b19013h001 double precision,
  b19013i001 double precision,
  b19019001 double precision,
  b19019002 double precision,
  b19019003 double precision,
  b19019004 double precision,
  b19019005 double precision,
  b19019006 double precision,
  b19019007 double precision,
  b19019008 double precision,
  b19025001 double precision,
  b19025a001 double precision,
  b19025b001 double precision,
  b19025c001 double precision,
  b19025d001 double precision,
  b19025e001 double precision,
  b19025f001 double precision,
  b19025g001 double precision,
  b19025h001 double precision,
  b19025i001 double precision,
  CONSTRAINT seq0056_pkey PRIMARY KEY (stusab , logrecno )
)

INSERT INTO acs2011_5yr_seq0056
SELECT "COL001", "COL002", "COL003", "COL004", "COL005", "COL006", "COL007", "COL008", "COL009", "COL010", "COL011", "COL012", "COL013", "COL014", "COL015", "COL016", "COL017", "COL018", "COL019", "COL020", "COL021", "COL022", "COL023", "COL024", "COL025", "COL026", "COL027", "COL028", "COL029", "COL030", "COL031", "COL032", "COL033", "COL034", "COL035", "COL036", "COL037", "COL038", "COL039", "COL040", "COL041", "COL042", "COL043", "COL044", "COL045", "COL046", "COL047", "COL048", "COL049", "COL050", "COL051", "COL052", "COL053", "COL054", "COL055", "COL056", "COL057", "COL058", "COL059", "COL060", "COL061", "COL062", "COL063", "COL064", "COL065", "COL066", "COL067", "COL068", "COL069", "COL070", "COL071", "COL072", "COL073", "COL074", "COL075", "COL076", "COL077", "COL078", "COL079", "COL080", "COL081", "COL082", "COL083", "COL084", "COL085", "COL086", "COL087", "COL088", "COL089", "COL090", "COL091", "COL092", "COL093", "COL094", "COL095", "COL096", "COL097", "COL098", "COL099", "COL100", "COL101", "COL102", "COL103", "COL104", "COL105", "COL106", "COL107", "COL108", "COL109", "COL110", "COL111", "COL112", "COL113", "COL114", "COL115", "COL116", "COL117", "COL118", "COL119", "COL120", "COL121", "COL122", "COL123", "COL124", "COL125", "COL126", "COL127", "COL128", "COL129", "COL130", "COL131", "COL132", "COL133", "COL134", "COL135", "COL136", "COL137", "COL138", "COL139", "COL140", "COL141", "COL142", "COL143", "COL144", "COL145", "COL146", "COL147", "COL148", "COL149", "COL150", "COL151", "COL152", "COL153", "COL154", "COL155", "COL156", "COL157", "COL158", "COL159", "COL160", "COL161", "COL162", "COL163", "COL164", "COL165", "COL166", "COL167", "COL168", "COL169", "COL170", "COL171", "COL172", "COL173", "COL174", "COL175", "COL176", "COL177", "COL178", "COL179", "COL180", "COL181", "COL182", "COL183", "COL184", "COL185", "COL186", "COL187", "COL188", "COL189", "COL190", "COL191", "COL192", "COL193", "COL194", "COL195", "COL196", "COL197", "COL198", "COL199", "COL200", "COL201", "COL202", "COL203", "COL204"
FROM "e20115ny0056000"

