CREATE TABLE users (
    userID      INT PRIMARY KEY,
    FirstName   VARCHAR(20),
    LastName    VARCHAR(20),
    emailID     VARCHAR(50),
    UserType    VARCHAR(20)
);

DESC users

CREATE TABLE transactions (
    transactionID   INT PRIMARY KEY,
    userID          INT,
    resourceID      INT,
    RentDate        DATE,
    ReturnDate      DATE
);

CREATE TABLE resources (
    resourceID  INT PRIMARY KEY,
    Title       VARCHAR (80),
    Author      VARCHAR (30),
    CategoryID  INT,
    Format      VARCHAR (20),
    Available   INT,
    Total       INT
);

CREATE TABLE accesslogs(
    logID       INT PRIMARY KEY,
    userID      INT,
    resourceID  INT,
    AccessTime  TIMESTAMP
);

CREATE TABLE inventory(
    invetoryID  INT PRIMARY KEY,
    resourceID  INT,
    Quantity    INT,
    Location    VARCHAR (20)
);

CREATE TABLE categories(
    categoryID      INT PRIMARY KEY,
    CategoryName    VARCHAR (20),
    Description     VARCHAR (20)
);

DESC categories

SELECT USER FROM DUAL

ALTER TABLE     TRANSACTIONS
ADD CONSTRAINT  fk_transactions_users
FOREIGN KEY     (userID)
REFERENCES      Users (userID)
ON DELETE SET NULL;

ALTER TABLE     TRANSACTIONS
ADD CONSTRAINT  fk_transactions_resources
FOREIGN KEY     (resourceID)
REFERENCES      Resources (resourceID)
ON DELETE SET NULL;

ALTER TABLE     ACCESSLOGS
ADD CONSTRAINT  fk_accesslogs_users
FOREIGN KEY     (userID)
REFERENCES      Users (userID)
ON DELETE SET NULL;

ALTER TABLE     ACCESSLOGS
ADD CONSTRAINT  fk_accesslogs_resources
FOREIGN KEY     (resourceID)
REFERENCES      Resources (resourceID)
ON DELETE SET NULL;

ALTER TABLE     Resources
ADD CONSTRAINT  fk_resources_categories
FOREIGN KEY     (categoryID)
REFERENCES      categories (categoryID)
ON DELETE SET NULL;
    
ALTER TABLE     Inventory
ADD CONSTRAINT  fk_inventory_resources
FOREIGN KEY     (resourceID)
REFERENCES      Resources (resourceID)
ON DELETE SET NULL;

SELECT * 
FROM USER_CONSTRAINTS 
WHERE CONSTRAINT_TYPE = 'R';


INSERT INTO users VALUES (1, 'John', 'Doe',	'johndoe@random.org', 'Student');
INSERT INTO users VALUES (2, 'Bell', 'Stringer', 'bellstringer@random.org', 'Teacher');
INSERT INTO users VALUES (3, 'Jill', 'Robinson', 'jillrobinson@yahoo.com', 'Student');
INSERT INTO users VALUES (4, 'Jenn', 'Rich', 'jennrich@random.org', 'Student');
INSERT INTO users VALUES (5, 'Bill', 'Robertson', 'billrobertson@random.org', 'Teacher');
INSERT INTO users VALUES (6, 'Ted',	'Wilkers', 'tedwilkers@random.org', 'Teacher');
INSERT INTO users VALUES (7, 'Max',	'Bowers', 'maxbowers@random.org', 'Student');
INSERT INTO users VALUES (8, 'Carl', 'Greenberg', 'carlgreenberg@random.org', 'Teacher');
INSERT INTO users VALUES (9, 'Freddie',	'Blunt', 'freddieblunt88@outlook.com', 'Student');
INSERT INTO users VALUES (10,'Anita', 'Maxwynn', 'anitamaxwynn@ovosound.com', 'fourstargeneral');

ALTER TABLE     categories
MODIFY          description VARCHAR(70);


INSERT INTO categories VALUES (4, 'Physics', 'Level 1 Physics Textbook');
INSERT INTO categories VALUES (3, 'Finance', 'PFinance Sheet Outlines');
INSERT INTO categories VALUES (1, 'Mathematics', 'Mathematics Resources');
INSERT INTO categories VALUES (2, 'Sociology', 'Sociology Studies');
INSERT INTO categories VALUES (5, 'Ethics', 'Ethics and Morality');
INSERT INTO categories VALUES (6, 'Management', 'Business and Management');
INSERT INTO categories VALUES (7, 'Geology', 'Geology Research');
INSERT INTO categories VALUES (8, 'Business', 'Getting to The Bread');

UPDATE  categories
SET     categoryname = 'Management'
WHERE   categoryid = (6);

INSERT INTO resources VALUES (6435, 'Level 1 Physics Textbook', 'Hansen, Bhris', 1, 'E-Textbook', 99, 100);
INSERT INTO resources VALUES (7564, 'Finance Sheet Outlines', 'Jowling, RK', 3, 'Outline', 987, 1000);
INSERT INTO resources VALUES (8768, 'Level 5 Math Textbook', 'Rahl, Doald', 2, 'E-Textbook', 73, 100);
INSERT INTO resources VALUES (6546, 'Finance Level 3 Practice Test', 'Wayne, Bruce', 3, 'Study Material', 932, 1000);
INSERT INTO resources VALUES (1238, 'Sociology Article', 'Rali, Balvatore', 4, 'Online Article', 3213, 10000);
INSERT INTO resources VALUES (8676, 'Ethics Study', 'Graham, Aubrey', 5, 'Research Study', 64, 100);
INSERT INTO resources VALUES (5646, 'Business Level 3 Exercise', 'Harrelson, Stoney', 6, 'Study Material', 545, 1000);
INSERT INTO resources VALUES (3456, 'Geological Study', 'Shackleton, Ernest', 7, 'Research Study', 43, 100);
INSERT INTO resources VALUES (7241, 'World Connects', 'Magger, Jick', 4, 'Study Material', 5, 1000);
INSERT INTO resources VALUES (9042, 'Getting to The Bread:', 'Sherm, Michael', 6, 'Study Material', 341, 1000);

UPDATE  resources
SET     title = 'Getting to The Bread: A Comprehensive Guide'
WHERE   resourceid = (9042);

INSERT INTO transactions VALUES (765748658, 1, 6435, TO_DATE('2025-04-12', 'YYYY-MM-DD'), TO_DATE('2025-10-12', 'YYYY-MM-DD'));
INSERT INTO transactions VALUES (574575474, 2, 7564, TO_DATE('2025-05-22', 'YYYY-MM-DD'), TO_DATE('2025-05-29', 'YYYY-MM-DD'));
INSERT INTO transactions VALUES (754745757, 3, 8768, TO_DATE('2025-08-11', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'));
INSERT INTO transactions VALUES (685864536, 4, 6546, TO_DATE('2025-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-02', 'YYYY-MM-DD'));
INSERT INTO transactions VALUES (574389326, 5, 1238, TO_DATE('2025-03-13', 'YYYY-MM-DD'), TO_DATE('2025-03-13', 'YYYY-MM-DD'));
INSERT INTO transactions VALUES (756757356, 6, 8676, TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-15', 'YYYY-MM-DD'));
INSERT INTO transactions VALUES (245436567, 7, 5646, TO_DATE('2025-10-10', 'YYYY-MM-DD'), TO_DATE('2025-10-10', 'YYYY-MM-DD'));
INSERT INTO transactions VALUES (853635653, 8, 3456, TO_DATE('2025-04-26', 'YYYY-MM-DD'), TO_DATE('2025-05-09', 'YYYY-MM-DD'));
INSERT INTO transactions VALUES (853621653, 9, 7241, TO_DATE('2025-03-15', 'YYYY-MM-DD'), TO_DATE('2025-04-02', 'YYYY-MM-DD'));
INSERT INTO transactions VALUES (853325653, 10, 9042, TO_DATE('2025-02-20', 'YYYY-MM-DD'), TO_DATE('2025-03-01', 'YYYY-MM-DD'));

INSERT INTO inventory VALUES (64354, 6435, 99, 'Cloud');
INSERT INTO inventory VALUES (76456, 7564, 987, 'Cloud');
INSERT INTO inventory VALUES (23435, 8768, 73, 'Cloud');
INSERT INTO inventory VALUES (87685, 6546, 932, 'Cloud');
INSERT INTO inventory VALUES (35475, 1238, 3213, 'Cloud');
INSERT INTO inventory VALUES (87544, 8676, 64, 'Cloud');
INSERT INTO inventory VALUES (34546, 5646, 545, 'Cloud');
INSERT INTO inventory VALUES (12342, 3456, 43, 'Cloud');
INSERT INTO inventory VALUES (43245, 7241, 5, 'Cloud');
INSERT INTO inventory VALUES (31563, 9042, 341, 'Cloud');

ALTER TABLE     accesslogs
MODIFY          logid VARCHAR(6);

INSERT INTO accesslogs VALUES ('J432', 1, 6435, TO_TIMESTAMP('2025-04-12 04:06', 'YYYY-MM-DD HH24:MI'));
INSERT INTO accesslogs VALUES ('G342', 2, 7564, TO_TIMESTAMP('2025-05-22 18:32', 'YYYY-MM-DD HH24:MI'));
INSERT INTO accesslogs VALUES ('H532', 3, 8768, TO_TIMESTAMP('2025-08-11 21:12', 'YYYY-MM-DD HH24:MI'));
INSERT INTO accesslogs VALUES ('B353', 4, 6546, TO_TIMESTAMP('2025-09-01 23:58', 'YYYY-MM-DD HH24:MI'));
INSERT INTO accesslogs VALUES ('K454', 5, 1238, TO_TIMESTAMP('2025-03-13 14:43', 'YYYY-MM-DD HH24:MI'));
INSERT INTO accesslogs VALUES ('N343', 6, 8676, TO_TIMESTAMP('2025-02-01 12:55', 'YYYY-MM-DD HH24:MI'));
INSERT INTO accesslogs VALUES ('M231', 7, 5646, TO_TIMESTAMP('2025-10-10 15:02', 'YYYY-MM-DD HH24:MI'));
INSERT INTO accesslogs VALUES ('D323', 8, 3456, TO_TIMESTAMP('2025-04-26 17:18', 'YYYY-MM-DD HH24:MI'));
INSERT INTO accesslogs VALUES ('R412', 9, 7241, TO_TIMESTAMP('2025-03-15 09:23', 'YYYY-MM-DD HH24:MI'));
INSERT INTO accesslogs VALUES ('U734', 10, 9042, TO_TIMESTAMP('2025-02-20 15:03', 'YYYY-MM-DD HH24:MI'));

/* The creation of this database followed three key steps for each entity. First, the creation
of each table with primary key constraints. Second, the addition of foreign key constraints tying 
tables together. Finally, values were added to each table.*/


SET SERVEROUTPUT ON

/*------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE FormatAndMailtype(
    fmFORMAT IN VARCHAR2,
    fmMAILTYPE IN VARCHAR2
    )
        IS
        fmt SYS_REFCURSOR;
   BEGINpo
        OPEN fmt FOR

            SELECT u.USERTYPE
            FROM USERS u
            WHERE u.userid IN (
                SELECT t.USERID
                FROM TRANSACTIONS t
                JOIN RESOURCES r
                ON r.RESOURCEID = t.RESOURCEID
                WHERE r.FORMAT = fmFORMAT)
            AND u.EMAILID LIKE '%' || fmMAILTYPE || '%';

        DBMS_SQL.RETURN_RESULT(fmt);
    END;
    
    BEGIN 
        FormatAndMailtype('Research Study', '.org');
    END;
        
/*-------------------------------------------------------------------
CREATED: 5/08/2025
AUTHOR: Mohammed ADMIN
DESCRIPTION: 
Queries the transaction table for transactions under two conditions: Email TLDs
and format type. This info is useful for determining who to market and cater towards

Example:

 
    BEGIN 
        FormatAndMailtype('Research Study', '.org');
    END;

CHANGE HISTORY

Date: 5/08/2025

Modified By: Mohammed ADMIN

Notes: Created Procedure
------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE TimeOfDayAccess (
    pStartTime IN VARCHAR2,
    pStartTime2 IN VARCHAR2
    )
    IS
        tda SYS_REFCURSOR;  
    BEGIN
        OPEN tda FOR
            SELECT USERID, RESOURCEID, COUNT(*) AS ACCESSTIMES
            FROM ACCESSLOGS
            WHERE TO_CHAR(ACCESSTIME, 'HH24:MI') BETWEEN pStartTime AND pStartTime2
            GROUP BY USERID, RESOURCEID
            ORDER BY COUNT(*) DESC;
    
        DBMS_SQL.RETURN_RESULT(tda);
    END;


/*-------------------------------------------------------------------
CREATED: 5/08/2025
AUTHOR: Mohammed ADMIN
DESCRIPTION: 
Shows what users, resources, and how many times they were accessed 
within a certain timeframe. Can be used to monitor server traffic and labor needs

Example:

  BEGIN
        TimeOfDayAccess('12:00' , '22:00');
  END;
    

CHANGE HISTORY

Date: 5/10/2025

Modified By: Daniel ADMIN

Notes: Modified to include resourceID in output
------------------------------------------------------------------*/
  CREATE OR REPLACE PROCEDURE InventoryWarning(
    
    hardline IN INT
    )
    IS 
        BEGIN
            FOR rec IN(
        
                SELECT TITLE, AUTHOR
                FROM RESOURCES
                WHERE AVAILABLE <= hardline
            )LOOP
            DBMS_OUTPUT.PUT_LINE ( 'Low stock: ' || rec.TITLE || ' by ' || rec.AUTHOR);
            END LOOP;
       END;
       
   BEGIN InventoryWarning(100);
   END;


/*-------------------------------------------------------------------
CREATED: 5/08/2025
AUTHOR: Mohammed ADMIN
DESCRIPTION: 
Shows what resources are low on stock depending on a baseline amount 
determined by the executor of the query.

Example:

  BEGIN
      InventoryWarning(100);
  END;
    

CHANGE HISTORY

Date: 5/10/2025

Modified By: Mohammed ADMIN

Notes: Created procedure.
------------------------------------------------------------------*/
 CREATE OR REPLACE PROCEDURE NewResource(
    
    rRESOURCEID IN INT,
    rTITLE IN VARCHAR2,
    rAUTHOR IN VARCHAR2,
    rCATEGORYID IN INT,
    rFORMAT IN VARCHAR2,
    rTOTAL IN INT
    
    )
    AS
        BEGIN
                INSERT INTO RESOURCES
                (RESOURCEID, TITLE, AUTHOR, CATEGORYID, FORMAT, AVAILABLE, TOTAL)
                VALUES
                (rRESOURCEID, rTITLE, rAUTHOR, rCATEGORYID, rFORMAT, rTOTAL, rTOTAL);
            COMMIT;
        END;

/*-------------------------------------------------------------------
CREATED: 5/08/2025
AUTHOR: Mohammed ADMIN
DESCRIPTION: 
Genesis type procedure, used to insert new resources into the database
Example:

    BEGIN NewResource
        (7215, 'The Math of Money', 'Simons, James',6,'Study Material', 1000);
    END;

CHANGE HISTORY

Date: 5/8/2025

Modified By: Mohammed ADMIN

Notes: Created procedure.
------------------------------------------------------------------*/
 CREATE OR REPLACE PROCEDURE UserCategory(
    
        pCategoryName IN VARCHAR2,
        pUserType IN VARCHAR2
    )
    IS
        uc SYS_REFCURSOR;
   BEGIN
        OPEN uc FOR
            SELECT  c.CATEGORYNAME, u.USERTYPE, COUNT(*) AS Total
                FROM    TRANSACTIONS t
                    JOIN    RESOURCES r
                    ON      t.RESOURCEID = r.RESOURCEID
                    JOIN    CATEGORIES c
                    ON      c.CATEGORYID = r.CATEGORYID
                    JOIN    USERS u
                    ON      u.USERID = t.USERID
                    WHERE   c.CATEGORYNAME = pCategoryName
                    AND     u.USERTYPE =  pUserType
                GROUP BY u.USERTYPE, c.CATEGORYNAME;
        
        DBMS_SQL.RETURN_RESULT(uc);
    END;

/*-------------------------------------------------------------------
CREATED: 5/08/2025
AUTHOR: Mohammed ADMIN
DESCRIPTION: 
This procedure counts results of combinations of user types and 
the categories that they decide to rent from our foundation. This should be used 
to find out who to cater to and guides future resource investments.
        
Example:
        
        BEGIN
            UserCategory('Management','Student');
        END;

CHANGE HISTORY

Date: 5/8/2025

Modified By: Mohammed ADMIN

Notes: Created procedure.
-------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE OverdueBooks_sp
        
        AS ob SYS_REFCURSOR;
        
    BEGIN
        OPEN ob FOR
        
            SELECT      t.RESOURCEID, t.RENTDATE, t.RETURNDATE, u.EMAILID,
            CASE
                WHEN t.RETURNDATE IS NULL AND SYSDATE - t.RENTDATE > 30 THEN 'Excessively overdue, must charge for resource'
                WHEN t.RETURNDATE IS NULL AND SYSDATE - t.RENTDATE > 20 THEN 'Overdue'
                ELSE 'Returned or Not Overdue'
            END AS OverdueStatus
            FROM        TRANSACTIONS t
            INNER JOIN  USERS u
            ON          u.USERID = t.USERID;
        
        DBMS_SQL.RETURN_RESULT (ob);
        
    END;
/*------------------------------------------------------------------
CREATED: 5/08/2025
AUTHOR: Mohammed ADMIN
DESCRIPTION: 
This procedure shows who has books overdue at 20 days checked out, and who is
checked out for a month or more

Example: EXEC OverdueBooks_SP

EXEC OverdueBooks_sp

CHANGE HISTORY

Date: 5/8/2025

Modified By: Daniel ADMIN

Notes: Created procedure.
-------------------------------------------------------------------*/

CREATE OR REPLACE PROCEDURE MostAccessedCats_sp

        AS mup SYS_REFCURSOR;

    BEGIN
        OPEN mup FOR
        
            SELECT c.CATEGORYNAME, SUM(x.total) AS total
            FROM (
                SELECT r.CATEGORYID, COUNT(*) AS total
                FROM ACCESSLOGS a
                JOIN RESOURCES r ON a.RESOURCEID = r.RESOURCEID
                GROUP BY r.CATEGORYID
            
                UNION ALL
            
                SELECT r.CATEGORYID, COUNT(*) AS total
                FROM TRANSACTIONS t
                JOIN RESOURCES r ON t.RESOURCEID = r.RESOURCEID
                GROUP BY r.CATEGORYID
            ) x
            JOIN CATEGORIES c ON x.CATEGORYID = c.CATEGORYID
            GROUP BY c.CATEGORYNAME
            ORDER BY total DESC;

        DBMS_SQL.RETURN_RESULT (mup);
    END;

EXEC MostAccessedCats_sp

/*-------------------------------------------------------------------
CREATED: 5/08/2025
AUTHOR: Mohammed ADMIN
DESCRIPTION: 
This procedure shows what categories are the most accessed, across both checked
out resources and locally accessed resources

Example: 

EXEC MostAccessedCats_sp

CHANGE HISTORY

Date: 5/08/2025

Modified By: Mohammed ADMIN

Notes: Created procedure.
------------------------------------------------------------------*/

CREATE OR REPLACE PROCEDURE TransactionUser_sp

        AS tu SYS_REFCURSOR;
    BEGIN
        OPEN tu FOR 
            SELECT USERTYPE, COUNT(USERTYPE)
            FROM TRANSACTIONSWITHUSERINFO_VW
            GROUP BY USERTYPE
            ORDER BY COUNT(USERTYPE) DESC;
        
        DBMS_SQL.RETURN_RESULT (tu);
    END;


EXEC TransactionUser_sp
/*-------------------------------------------------------------------
CREATED: 5/08/2025
AUTHOR: Mohammed ADMIN
DESCRIPTION: 
This procedure counts what types of users have checked out resources

Example: 

EXEC MostAccessedCats_sp

CHANGE HISTORY

Date: 5/08/2025

Modified By: Mohammed ADMIN

Notes: Created procedure.
-------------------------------------------------------------------*/

CREATE OR REPLACE VIEW FULLINVENTORYINFO_VW AS
SELECT 
    r.RESOURCEID,
    r.TITLE,
    r.AUTHOR,
    r.CATEGORYID,
    c.CATEGORYNAME,
    c.DESCRIPTION,
    r.FORMAT,
    r.AVAILABLE,
    r.TOTAL,
    i.INVENTORYID,
    i.LOCATION
FROM 
    RESOURCES r
    JOIN CATEGORIES c ON r.CATEGORYID = c.CATEGORYID
    JOIN INVENTORY i ON r.RESOURCEID = i.RESOURCEID;

CREATE OR REPLACE VIEW TRANSACTIONSWITHUSERINFO_VW AS
SELECT
    t.TRANSACTIONID,
    t.USERID,
    t.RESOURCEID,
    t.RENTDATE,
    t.RETURNDATE,
    u.FIRSTNAME,
    u.LASTNAME,
    u.EMAILID,
    u.USERTYPE
FROM 
    TRANSACTIONS t
    JOIN USERS u ON t.USERID = u.USERID;


