# https://www.erdcloud.com/d/PsDTmWwCgyxQgbSxe
DROP DATABASE IF EXISTS tableup;
CREATE DATABASE tableup;
USE tableup;

DROP TABLE IF EXISTS `ReviewScore`;

CREATE TABLE `ReviewScore` (
	`rs_num`	INT PRIMARY KEY AUTO_INCREMENT NOT	NULL,
	`rs_rev_num`	INT	NULL,
	`RS_ST_NUM`	INT	 NULL,
	`rs_score`	INT	NULL
);

DROP TABLE IF EXISTS `Facility`;

CREATE TABLE `Facility` (
	`fc_num`	INT PRIMARY KEY AUTO_INCREMENT NOT	NULL,
	`fc_name`	VARCHAR(50)	 NULL
);

DROP TABLE IF EXISTS `MENU`;

CREATE TABLE `MENU` (
	`MN_NUM`	INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`MN_NAME`	VARCHAR(50)	NULL,
	`MN_IMG`	VARCHAR(255)	NULL,
	`MN_PRICE`	int	NULL,
	`MN_CONTENT`	VARCHAR(50)	NULL,
	`MN_MT_NUM`	INT	NOT NULL,
	`mn_rt_num`	INT	NULL
);

DROP TABLE IF EXISTS `Payment`;

CREATE TABLE `Payment` (
	`pay_num`	INT PRIMARY KEY AUTO_INCREMENT NOT	NULL,
	`pay_res_num`	INT	NULL,
	`pay_method`	VARCHAR(50)	NULL,
	`pay_amount`	INT	NULL,
	`pay_status`	VARCHAR(30)	NULL,
	`pay_time`	DATETIME	NULL
);

DROP TABLE IF EXISTS `Tag`;

CREATE TABLE `Tag` (
	`tag_num`	INT PRIMARY KEY AUTO_INCREMENT NOT	NULL,
	`tag_name`	VARCHAR(50)	 NULL,
	`TAG_TT_NUM`	INT	 NULL
);

DROP TABLE IF EXISTS `TagType`;

CREATE TABLE `TagType` (
	`TT_NUM`	INT PRIMARY KEY AUTO_INCREMENT NOT	 NULL,
	`TT_NAME`	VARCHAR(50)	NULL
);

DROP TABLE IF EXISTS `MenuType`;

CREATE TABLE `MenuType` (
	`MT_NUM`	INT PRIMARY KEY AUTO_INCREMENT NOT	 NULL,
	`MT_NAME`	VARCHAR(50)	NULL
);

DROP TABLE IF EXISTS `Restaurant`;

CREATE TABLE `Restaurant` (
	`rt_num`	INT PRIMARY KEY AUTO_INCREMENT NOT	NULL,
	`rt_name`	VARCHAR(100)	NOT NULL,
	`rt_reg_num`	INT	NULL,
	`rt_fc_num`	INT	NULL,
	`rt_open_hours`	VARCHAR(100)	NULL,
	`rt_closed_days`	VARCHAR(100)	NULL,
	`rt_price_lunch`	VARCHAR(20)	NULL,
	`rt_price_dinner`	VARCHAR(20)	NULL,
	`rt_image`	VARCHAR(255)	NULL
);

DROP TABLE IF EXISTS `calendar`;

CREATE TABLE `calendar` (
	`CA_NUM`	INT PRIMARY KEY AUTO_INCREMENT NOT	 NULL
);

DROP TABLE IF EXISTS `RestaurantFacility`;

CREATE TABLE `RestaurantFacility` (
	`rfa_fc_num`	INT	NULL,
	`rfa_rt_num`	INT	NULL
);

DROP TABLE IF EXISTS `Admin`;

CREATE TABLE `Admin` (
	`ad_id`	VARCHAR(50) PRIMARY KEY NOT	NULL,
	`ad_pw`	VARCHAR(255)	 NULL
);

DROP TABLE IF EXISTS `Review`;

CREATE TABLE `Review` (
	`rev_num`	INT PRIMARY KEY AUTO_INCREMENT NOT	NULL,
	`rev_us_id`	VARCHAR(50)	NULL,
	`rev_rt_num`	INT	NULL,
	`rev_content`	LONGTEXT	NULL,
	`rev_created`	DATETIME	NULL,
	`rev_updated`	DATETIME	NULL,
	`rev_state`	INT	NULL
);

DROP TABLE IF EXISTS `File`;

CREATE TABLE `File` (
	`file_num`	INT PRIMARY KEY AUTO_INCREMENT NOT	NULL,
	`file_rev_num`	INT	NULL,
	`file_path`	VARCHAR(255)	 NULL
);

DROP TABLE IF EXISTS `RestaurantTag`;

CREATE TABLE `RestaurantTag` (
	`rta_rt_num`	INT	NULL,
	`rta_tag_num`	INT	NULL
);

DROP TABLE IF EXISTS `RestaurantManager`;

CREATE TABLE `RestaurantManager` (
	`rm_id`	VARCHAR(50) PRIMARY KEY NOT	NULL,
	`rm_pw`	VARCHAR(255)	 NULL,
	`rm_email`	VARCHAR(100)	 NULL,
	`rm_name`	VARCHAR(50)	NULL,
	`rm_phone`	VARCHAR(20)	NULL,
	`rm_business`	VARCHAR(30)	NULL,
	`rm_rt_num`	INT	NULL
);

DROP TABLE IF EXISTS `Region`;

CREATE TABLE `Region` (
	`reg_num`	INT PRIMARY KEY AUTO_INCREMENT NOT	NULL,
	`reg_main`	VARCHAR(50)	 NULL,
	`reg_sub`	VARCHAR(50)	 NULL
);

DROP TABLE IF EXISTS `BusinessHour`;

CREATE TABLE `BusinessHour` (
	`bh_num`	INT PRIMARY KEY AUTO_INCREMENT NOT	NULL,
	`bh_rt_num`	INT	NULL,
	`bh_day`	ENUM('월','화','수','목','금','토','일')	 NULL,
	`bh_interval`	ENUM('30분', '1시간', '2시간')	 NULL,
	`bh_start`	TIME	 NULL,
	`bh_seat_count`	INT	NULL
);

DROP TABLE IF EXISTS `RestaurantDetail`;

CREATE TABLE `RestaurantDetail` (
	`RD_NUM`	INT PRIMARY KEY AUTO_INCREMENT NOT	 NULL,
	`rd_rt_num`	INT	NULL,
	`rd_description`	LONGTEXT	NULL
);

DROP TABLE IF EXISTS `Reservation`;

CREATE TABLE `Reservation` (
	`res_num`	INT PRIMARY KEY AUTO_INCREMENT NOT	NULL,
	`res_us_id`	VARCHAR(50)	NULL,
	`res_rt_num`	INT	NULL,
	`res_time`	DATETIME	 NULL,
	`res_person`	INT	 NULL,
	`res_request`	TEXT	NULL,
	`res_created`	DATETIME	NULL,
	`res_state`	INT	NULL
);

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
	`us_id`	VARCHAR(50) PRIMARY KEY NOT	NULL,
	`us_name`	VARCHAR(50)	 NULL,
	`us_phone`	VARCHAR(20)	 NULL,
	`us_email`	VARCHAR(100)	 NULL,
	`us_nickname`	VARCHAR(50)	NULL,
	`us_sociallogin`	BOOLEAN	NULL,
	`us_created`	DATETIME	NULL
);

DROP TABLE IF EXISTS `ScoreType`;

CREATE TABLE `ScoreType` (
	`ST_NUM`	INT PRIMARY KEY AUTO_INCREMENT NOT	 NULL,
	`ST_CATEGORY`	VARCHAR(50)	NULL
);

DROP TABLE IF EXISTS `RestaurantDate`;

CREATE TABLE `RestaurantDate` (
	`rd_num`	INT PRIMARY KEY AUTO_INCREMENT NOT	 NULL,
	`rd_day`	VARCHAR(50)	NULL,
	`rd_rt_num`	INT	NULL,
	`rd_time`	VARCHAR(50)	NULL
);

DROP TABLE IF EXISTS `FoodCategory`;

CREATE TABLE `FoodCategory` (
	`fc_num`	INT PRIMARY KEY AUTO_INCREMENT NOT	NULL,
	`fc_main`	VARCHAR(50)	NOT NULL,
	`fc_sub`	VARCHAR(50)	NOT NULL
);

ALTER TABLE `ReviewScore` ADD CONSTRAINT `FK_Review_TO_ReviewScore_1` FOREIGN KEY (
	`rs_rev_num`
)
REFERENCES `Review` (
	`rev_num`
);

ALTER TABLE `ReviewScore` ADD CONSTRAINT `FK_ScoreType_TO_ReviewScore_1` FOREIGN KEY (
	`RS_ST_NUM`
)
REFERENCES `ScoreType` (
	`ST_NUM`
);

ALTER TABLE `MENU` ADD CONSTRAINT `FK_MenuType_TO_MENU_1` FOREIGN KEY (
	`MN_MT_NUM`
)
REFERENCES `MenuType` (
	`MT_NUM`
);

ALTER TABLE `MENU` ADD CONSTRAINT `FK_Restaurant_TO_MENU_1` FOREIGN KEY (
	`mn_rt_num`
)
REFERENCES `Restaurant` (
	`rt_num`
);

ALTER TABLE `Payment` ADD CONSTRAINT `FK_Reservation_TO_Payment_1` FOREIGN KEY (
	`pay_res_num`
)
REFERENCES `Reservation` (
	`res_num`
);

ALTER TABLE `Tag` ADD CONSTRAINT `FK_TagType_TO_Tag_1` FOREIGN KEY (
	`TAG_TT_NUM`
)
REFERENCES `TagType` (
	`TT_NUM`
);

ALTER TABLE `Restaurant` ADD CONSTRAINT `FK_Region_TO_Restaurant_1` FOREIGN KEY (
	`rt_reg_num`
)
REFERENCES `Region` (
	`reg_num`
);

ALTER TABLE `Restaurant` ADD CONSTRAINT `FK_FoodCategory_TO_Restaurant_1` FOREIGN KEY (
	`rt_fc_num`
)
REFERENCES `FoodCategory` (
	`fc_num`
);

ALTER TABLE `RestaurantFacility` ADD CONSTRAINT `FK_Facility_TO_RestaurantFacility_1` FOREIGN KEY (
	`rfa_fc_num`
)
REFERENCES `Facility` (
	`fc_num`
);

ALTER TABLE `RestaurantFacility` ADD CONSTRAINT `FK_Restaurant_TO_RestaurantFacility_1` FOREIGN KEY (
	`rfa_rt_num`
)
REFERENCES `Restaurant` (
	`rt_num`
);

ALTER TABLE `Review` ADD CONSTRAINT `FK_User_TO_Review_1` FOREIGN KEY (
	`rev_us_id`
)
REFERENCES `User` (
	`us_id`
);

ALTER TABLE `Review` ADD CONSTRAINT `FK_Restaurant_TO_Review_1` FOREIGN KEY (
	`rev_rt_num`
)
REFERENCES `Restaurant` (
	`rt_num`
);

ALTER TABLE `File` ADD CONSTRAINT `FK_Review_TO_File_1` FOREIGN KEY (
	`file_rev_num`
)
REFERENCES `Review` (
	`rev_num`
);

ALTER TABLE `RestaurantTag` ADD CONSTRAINT `FK_Restaurant_TO_RestaurantTag_1` FOREIGN KEY (
	`rta_rt_num`
)
REFERENCES `Restaurant` (
	`rt_num`
);

ALTER TABLE `RestaurantTag` ADD CONSTRAINT `FK_Tag_TO_RestaurantTag_1` FOREIGN KEY (
	`rta_tag_num`
)
REFERENCES `Tag` (
	`tag_num`
);

ALTER TABLE `RestaurantManager` ADD CONSTRAINT `FK_Restaurant_TO_RestaurantManager_1` FOREIGN KEY (
	`rm_rt_num`
)
REFERENCES `Restaurant` (
	`rt_num`
);

ALTER TABLE `BusinessHour` ADD CONSTRAINT `FK_Restaurant_TO_BusinessHour_1` FOREIGN KEY (
	`bh_rt_num`
)
REFERENCES `Restaurant` (
	`rt_num`
);

ALTER TABLE `RestaurantDetail` ADD CONSTRAINT `FK_Restaurant_TO_RestaurantDetail_1` FOREIGN KEY (
	`rd_rt_num`
)
REFERENCES `Restaurant` (
	`rt_num`
);

ALTER TABLE `Reservation` ADD CONSTRAINT `FK_User_TO_Reservation_1` FOREIGN KEY (
	`res_us_id`
)
REFERENCES `User` (
	`us_id`
);

ALTER TABLE `Reservation` ADD CONSTRAINT `FK_Restaurant_TO_Reservation_1` FOREIGN KEY (
	`res_rt_num`
)
REFERENCES `Restaurant` (
	`rt_num`
);

ALTER TABLE `RestaurantDate` ADD CONSTRAINT `FK_Restaurant_TO_RestaurantDate_1` FOREIGN KEY (
	`rd_rt_num`
)
REFERENCES `Restaurant` (
	`rt_num`
);

