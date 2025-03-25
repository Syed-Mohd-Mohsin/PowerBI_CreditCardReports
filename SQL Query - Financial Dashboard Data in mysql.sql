-- Import data into table through "Table Data Import Wizard" feature

SELECT * FROM credit_card_db.credit_card;
SHOW COLUMNS FROM credit_card_db.credit_card;

-- Converting Week_Start_Date column data type from text to date
ALTER TABLE credit_card
CHANGE COLUMN `Week_Start_Date` `Week_Start_Date` DATE; -- THIS QUERY DOESN'T WORK BECAUSE IT HAS TWO TYPE OF DATE FORMATS
UPDATE credit_card
SET `Week_Start_Date` = 
	CASE 
        WHEN Week_Start_Date LIKE '%/%' THEN 
            DATE_FORMAT(STR_TO_DATE(Week_Start_Date, '%e/%c/%Y'), '%Y/%m/%d')
        WHEN Week_Start_Date LIKE '%-%' THEN 
            DATE_FORMAT(STR_TO_DATE(Week_Start_Date, '%d-%m-%Y'), '%Y/%m/%d')
        ELSE NULL -- Handle invalid formats
    END
;
ALTER table credit_card
modify Week_Start_Date date;