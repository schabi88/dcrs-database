--------------DesignStatus--------------
CREATE TABLE DesignStatus
(
id COUNTER NOT NULL,
name CHAR(255) NOT NULL,
dfe_comment_commerical LONGTEXT,
dfe_comment_consumer LONGTEXT,
category CHAR(255),
description LONGTEXT,
PRIMARY KEY (id) 
);
------------------------------------------

--------------RegulationStatus--------------
CREATE TABLE RegulationStatus
(
id COUNTER NOT NULL,
name CHAR(255) NOT NULL,
category CHAR(255),
description LONGTEXT,
PRIMARY KEY (id) 
);
------------------------------------------

--------------ChemComp--------------
CREATE TABLE ChemComp
(
ema_id INTEGER NOT NULL,
concentration FLOAT NOT NULL,
entry_created_person_id INTEGER NOT NULL,
last_edit_toxicologist_id INTEGER,
last_edit_steward_id INTEGER,
component_name CHAR(255),
cas_number CHAR(255),
ec_number CHAR(255),
trade_name CHAR(255),
proposed_generic_name LONGTEXT,
secondary_synonym LONGTEXT,
component_type LONGTEXT,
formulation_type LONGTEXT,
mixture_instructions LONGTEXT,
chemical_formula CHAR(100),
chemical_structure LONGTEXT,
component_status LONGTEXT,
obsolete_date DATETIME,
dfe_rating LONGTEXT,
npi_messaging LONGTEXT,
legacy_product_messaging LONGTEXT,
regulatory_threshold BIT,
regulatory_threshold_comment LONGTEXT,
confidence_level LONGTEXT,
cmrs_confidence_level LONGTEXT,
future_risk_rating LONGTEXT,
gs_benchmark_score LONGTEXT,
classification BIT,
classification_source LONGTEXT,
chemical_safety_report BIT,
chemical_safety_report_source LONGTEXT,
echa_registration LONGTEXT,
echa_tonnage_band INTEGER,
echa_registration_date DATETIME,
chem_screening_hit BIT,
chem_screening_hit_region LONGTEXT,
transportational_classification LONGTEXT,
transportational_classification_source LONGTEXT,
occupational_exposure_limits BIT,
sara_313 BIT,
ca_prop_65 BIT,
pbt BIT,
vpvb BIT,
voc BIT,
svhc BIT,
flashpoint_oc FLOAT,
flashpoint_cc FLOAT,
boilingpoiht FLOAT,
corrosivity FLOAT,
vaporpressure FLOAT,
s14_information LONGTEXT,
aqua_toxicity LONGTEXT,
modular_formulation LONGTEXT,
influence_dfe BIT,
influence_dfe_comment LONGTEXT,
regulated_metals BIT,
regulated_organics BIT,
halogenated_organic_compounds BIT,
hap BIT,
california_toxic_air_contaminant BIT,
controlled_substance BIT,
restricted_azo_colorant BIT,
listed_marine_pollutant BIT,
other_regulatory_information LONGTEXT,
eye_irritant BIT,
skin_irritant BIT,
skin_sensitizer BIT,
entry_created_time DATETIME,
last_edit_steward_time DATETIME,
last_edit_toxicologist_time DATETIME,
description LONGTEXT,

PRIMARY KEY(ema_id),
FOREIGN KEY (entry_created_person_id) REFERENCES UserData(id),
FOREIGN KEY (last_edit_toxicologist_id) REFERENCES UserData(id),
FOREIGN KEY (last_edit_steward_id) REFERENCES UserData(id)
);
------------------------------------------

--------------Ink--------------
CREATE TABLE Ink
(
ema_id INTEGER NOT NULL,
entry_created_person_id INTEGER,
last_edit_toxicologist_id INTEGER,
last_edit_steward_id INTEGER,
name_code CHAR(255),
target_market CHAR(255),
content_water FLOAT,
content_organic FLOAT,
density FLOAT,
flashpoint FLOAT,
corrosivity FLOAT,
ph FLOAT,
solids_or_non_volatile CHAR(255),
content_voc_swiss FLOAT,
content_voc_rinko_american_research FLOAT,
acquatic_toxicity FLOAT,
is_dcrs BIT,
entry_created_time DATETIME,
last_edit_steward_time DATETIME,
last_edit_toxicologist_time DATETIME,
comment LONGTEXT,

PRIMARY KEY (ema_id),
FOREIGN KEY (entry_created_person_id) REFERENCES UserData(id),
FOREIGN KEY (last_edit_toxicologist_id) REFERENCES UserData(id),
FOREIGN KEY (last_edit_steward_id) REFERENCES UserData(id)
);
------------------------------------------

--------------UserData--------------
CREATE TABLE UserData
(
id COUNTER NOT NULL,
name CHAR(255) NOT NULL,
category CHAR(255) NOT NULL,
description LONGTEXT,
PRIMARY KEY (id) 
);
------------------------------------------

--------------HPhrase--------------
CREATE TABLE HPhrase
(
id COUNTER NOT NULL,
category_id INTEGER,
property_id INTEGER,
name CHAR(255) NOT NULL,
code CHAR(10) NOT NULL,
category_number CHAR(10),
description LONGTEXT,

PRIMARY KEY (id),
FOREIGN KEY (category_id) REFERENCES Hcategory(id),
FOREIGN KEY (property_id) REFERENCES Hproperty(id)
);
------------------------------------------

--------------Hcategory--------------
CREATE TABLE Hcategory
(
id COUNTER NOT NULL,
name CHAR(255) NOT NULL,

PRIMARY KEY (id)
);
------------------------------------------

--------------Hproperty--------------
CREATE TABLE Hproperty
(
id COUNTER NOT NULL,
name CHAR(255) NOT NULL,

PRIMARY KEY (id)
);
------------------------------------------

--------------Product--------------
CREATE TABLE Product
(
id COUNTER NOT NULL,
name CHAR(255) NOT NULL,
code CHAR(255),
description LONGTEXT,
PRIMARY KEY (id) 
);
------------------------------------------

--------------RegulatedMetal--------------
CREATE TABLE RegulatedMetal
(
id COUNTER NOT NULL,
name CHAR(255) NOT NULL,
us_tlcp_limit INTEGER,
ca_stlc_limit INTEGER,
ca_ttlc_limit INTEGER,
dfe_limit INTEGER,
description LONGTEXT,
PRIMARY KEY (id) 
);
------------------------------------------

--------------DangerSymbol--------------
CREATE TABLE DangerSymbol
(
id COUNTER NOT NULL,
name CHAR(255) NOT NULL,
description LONGTEXT,
PRIMARY KEY (id) 
);
------------------------------------------

--------------ToxEndpointDataTest--------------
CREATE TABLE ToxEndPointDataTest
(
id COUNTER NOT NULL,
name CHAR(255) NOT NULL,
description LONGTEXT,
comment LONGTEXT,
PRIMARY KEY (id) 
);
------------------------------------------

--------------Supplier--------------
CREATE TABLE Supplier
(
id COUNTER NOT NULL,
name CHAR(255) NOT NULL,
description LONGTEXT,
PRIMARY KEY (id) 
);
------------------------------------------

--------------GreenScreenStatus--------------
CREATE TABLE GreenScreenStatus
(
id COUNTER NOT NULL,
name CHAR(255) NOT NULL,
category CHAR(255),
description LONGTEXT,
PRIMARY KEY (id) 
);
------------------------------------------

--------------SupplierDocument--------------
CREATE TABLE SupplierDocument
(
id COUNTER NOT NULL,
supplier_id INTEGER,
ema_id INTEGER,
link LONGTEXT,
date_of_publication DATETIME,
entry_created_time DATETIME,
document_type CHAR(255),
comment LONGTEXT,

PRIMARY KEY (id),
FOREIGN KEY(supplier_id) REFERENCES Supplier(id),
FOREIGN KEY(ema_id) REFERENCES ChemComp(ema_id)
);
------------------------------------------

--------------GreenScreenStatus-ChemComp--------------
CREATE TABLE GreenScreenStatus_ChemComp
(
green_screen_status_id INTEGER NOT NULL,
ema_id INTEGER NOT NULL,
entry_created_person_id INTEGER NOT NULL,
last_edit_toxicologist_id INTEGER,
last_edit_steward_id INTEGER,
status CHAR(255),
entry_created_time DATETIME,
last_edit_steward_time DATETIME,
last_edit_toxicologist_time DATETIME,
comment LONGTEXT,

PRIMARY KEY(green_screen_status_id, ema_id),
FOREIGN KEY (green_screen_status_id) REFERENCES GreenScreenStatus(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id),
FOREIGN KEY (entry_created_person_id) REFERENCES UserData(id),
FOREIGN KEY (last_edit_toxicologist_id) REFERENCES UserData(id),
FOREIGN KEY (last_edit_steward_id) REFERENCES UserData(id)
);
------------------------------------------

--------------ToxEndpointDataTest-ChemComp--------------
CREATE TABLE ToxEndpointDataTest_ChemComp
(
test_data_id INTEGER NOT NULL,
ema_id INTEGER NOT NULL,
entry_created_person_id INTEGER NOT NULL,
last_edit_toxicologist_id INTEGER,
last_edit_steward_id INTEGER,
vivo_vitro CHAR(255),
species CHAR(255),
oecd_number INTEGER,
test_value FLOAT,
test_iteration INTEGER,
unit CHAR(255),
entry_created_time DATETIME,
last_edit_steward_time DATETIME,
last_edit_toxicologist_time DATETIME,

PRIMARY KEY(test_data_id, ema_id),
FOREIGN KEY (test_data_id) REFERENCES ToxEndpointDataTest(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id),
FOREIGN KEY (entry_created_person_id) REFERENCES UserData(id),
FOREIGN KEY (last_edit_toxicologist_id) REFERENCES UserData(id),
FOREIGN KEY (last_edit_steward_id) REFERENCES UserData(id)
);
------------------------------------------

--------------DangerSymbol_Ink--------------
CREATE TABLE DangerSymbol_Ink
(
danger_symbol_id INTEGER NOT NULL,
ema_id INTEGER NOT NULL,
comment LONGTEXT,

PRIMARY KEY(danger_symbol_id, ema_id),
FOREIGN KEY (danger_symbol_id) REFERENCES DangerSymbol(id),
FOREIGN KEY (ema_id) REFERENCES Ink(ema_id)
);
------------------------------------------

--------------Product-Ink--------------
CREATE TABLE Product_Ink
(
product_id INTEGER NOT NULL,
ema_id INTEGER NOT NULL,
comment LONGTEXT,

PRIMARY KEY(product_id, ema_id),
FOREIGN KEY (product_id) REFERENCES Product(id),
FOREIGN KEY (ema_id) REFERENCES Ink(ema_id)
);
------------------------------------------

--------------RegulatedMetal_Ink--------------
CREATE TABLE RegulatedMetal_Ink
(
regulated_metal_id INTEGER NOT NULL,
ema_id INTEGER NOT NULL,
comment LONGTEXT,

PRIMARY KEY(regulated_metal_id, ema_id),
FOREIGN KEY (regulated_metal_id) REFERENCES RegulatedMetal(id),
FOREIGN KEY (ema_id) REFERENCES Ink(ema_id)
);
------------------------------------------

--------------Hphrase-Ink--------------
CREATE TABLE HPhrase_Ink
(
hphrase_id INTEGER NOT NULL,
ema_id INTEGER NOT NULL,
comment LONGTEXT,

PRIMARY KEY(hphrase_id, ema_id),
FOREIGN KEY (hphrase_id) REFERENCES Hphrase(id),
FOREIGN KEY (ema_id) REFERENCES Ink(ema_id)
);
------------------------------------------

--------------ChemComp-ChemComp--------------
CREATE TABLE ChemComp_ChemComp
(
primary_ema_id INTEGER NOT NULL,
secondary_ema_id INTEGER NOT NULL,
weight_percentage FLOAT NOT NULL,
comment LONGTEXT,

PRIMARY KEY(primary_ema_id, secondary_ema_id),
FOREIGN KEY (primary_ema_id) REFERENCES ChemComp(ema_id),
FOREIGN KEY (secondary_ema_id) REFERENCES ChemComp(ema_id)
);
------------------------------------------

--------------Ink-ChemComp--------------
CREATE TABLE Ink_ChemComp
(
primary_ema_id INTEGER NOT NULL,
secondary_ema_id INTEGER NOT NULL,
weight_percentage FLOAT NOT NULL,
comment LONGTEXT,

PRIMARY KEY(primary_ema_id, secondary_ema_id),
FOREIGN KEY (primary_ema_id) REFERENCES Ink(ema_id),
FOREIGN KEY (secondary_ema_id) REFERENCES ChemComp(ema_id)
);
------------------------------------------

--------------Supplier-ChemComp--------------
CREATE TABLE Supplier_ChemComp
(
supplier_id INTEGER NOT NULL,
ema_id INTEGER NOT NULL,
comment LONGTEXT,

PRIMARY KEY(supplier_id, ema_id),
FOREIGN KEY (supplier_id) REFERENCES Supplier(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
------------------------------------------

--------------Hphrase-ChemComp--------------
CREATE TABLE HPhrase_ChemComp
(
hphrase_id INTEGER NOT NULL,
ema_id INTEGER NOT NULL,
comment LONGTEXT,

PRIMARY KEY(hphrase_id, ema_id),
FOREIGN KEY (hphrase_id) REFERENCES Hphrase(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
------------------------------------------

--------------DesignStatus-Ink--------------
CREATE TABLE DesignStatus_Ink
(
status_id INTEGER NOT NULL,
ema_id INTEGER NOT NULL,
entry_created_person_id INTEGER NOT NULL,
last_edit_toxicologist_id INTEGER,
last_edit_steward_id INTEGER,
status LONGTEXT,
current_situation LONGTEXT,
impact LONGTEXT,
next_steps LONGTEXT,
supporting_data LONGTEXT,
reference LONGTEXT,
entry_created_time DATETIME,
last_edit_steward_time DATETIME,
last_edit_toxicologist_time DATETIME,

PRIMARY KEY(status_id, ema_id),
FOREIGN KEY (status_id) REFERENCES DesignStatus(id),
FOREIGN KEY (ema_id) REFERENCES Ink(ema_id)
);
------------------------------------------

--------------RegulationStatus-Ink--------------
CREATE TABLE RegulationStatus_Ink
(
status_id INTEGER NOT NULL,
ema_id INTEGER NOT NULL,
entry_created_person_id INTEGER NOT NULL,
last_edit_toxicologist_id INTEGER,
last_edit_steward_id INTEGER,
status LONGTEXT,
current_situation LONGTEXT,
impact LONGTEXT,
next_steps LONGTEXT,
supporting_data LONGTEXT,
reference LONGTEXT,
entry_created_time DATETIME,
last_edit_steward_time DATETIME,
last_edit_toxicologist_time DATETIME,

PRIMARY KEY(status_id, ema_id),
FOREIGN KEY (status_id) REFERENCES RegulationStatus(id),
FOREIGN KEY (ema_id) REFERENCES Ink(ema_id)
);
------------------------------------------

--------------INVENTORY TRACKING--------------
-------------------------------------------------

--------------Australia--------------
CREATE TABLE Australia
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
confidential_inventory BIT,
volume_restriction FLOAT,
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------

--------------Canada--------------
CREATE TABLE Canada
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
volume_restriction FLOAT,
snac BIT,
province_ontario BIT,
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------

--------------China--------------
CREATE TABLE China
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
volume_restriction FLOAT,
legal_entities CHAR(255),
confidential_inventory BIT,
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------

--------------EU--------------
CREATE TABLE EU
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------

--------------JapanENCS--------------
CREATE TABLE JapanENCS
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
inventory_number FLOAT,
volume_restriction FLOAT,
confidential_inventory FLOAT,
renewal_date DATETIME,
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------
--------------JapanISHL--------------
CREATE TABLE JapanISHL
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
inventory_number FLOAT,
volume_restriction FLOAT,
renewal_date DATETIME,
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------

--------------Korea--------------
CREATE TABLE Korea
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
category CHAR(100),
inventory_number FLOAT,
volume_restriction FLOAT,
applicable_tonnage_band FLOAT,
renewal_date DATETIME,
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------

--------------NewZealand--------------
CREATE TABLE NewZealand
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
approval_numbers FLOAT,
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------

--------------Philippines--------------
CREATE TABLE Philippines
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
volume_restriction FLOAT,
noc_filled BIT,
renewal_date DATETIME,
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------

--------------Switzerland--------------
CREATE TABLE Switzerland
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
inventory_number FLOAT,
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------

--------------Taiwan--------------
CREATE TABLE Taiwan
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
volume_restriction FLOAT,
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------

--------------Turkey--------------
CREATE TABLE Turkey
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------

--------------USA--------------
CREATE TABLE USA
(
id COUNTER NOT NULL,
ema_id INTEGER NOT NULL,
status CHAR(100),
noc_filled BIT,
comment LONGTEXT,

PRIMARY KEY(id),
FOREIGN KEY (ema_id) REFERENCES ChemComp(ema_id)
);
-------------------------------------------------
