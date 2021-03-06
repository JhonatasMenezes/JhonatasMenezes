-- FUNCTION FOR TO SHOW DIFERENCE BETWEEN TWO DATES
-- IT SHOW MONTHS AND DAYS OF DIFERENCE

-- AT THE MOMENT, ITS SHOW JUST APROXIMATE VALUE (ALMOST EXACT)
-- BUT I'LL IMPROVE IT SOON

-- TWO PARAMETERS FOR EACH DATE OF RESEARCH
CREATE OR REPLACE FUNCTION FCT_MONTHS_DIFERENCE
(P_FIRST_DATE IN DATE, P_SEC_DATE IN DATE) RETURN CHAR
IS

-- A VAR FOR THE FUNCTION (MONTHS_BETWEEN) RESULT
V_MONTHS_DAYS NUMBER;
-- A VAR FOR STORE THE DAYS VALUE
V_FORMAT NUMBER;

-- AUXILIAR VARIABLES
V_AVG_M NUMBER;
V_MONTHS NUMBER;
V_DAYS NUMBER;

-- ONE FOR STORE THE FINAL RESULT
V_RESULT CHAR(30);
BEGIN

-- AVERAGE MULTIPLIER FOR AVERAGE OF EACH DAY IN A MONTH 
V_AVG_M := 0,0311;

-- HERE WE'LL OBTAIN THE MAIN VALUE
SELECT MONTHS_BETWEEN(TO_DATE(P_SEC_DATE,'DD/MM/YYYY'),
                      TO_DATE(P_FIRST_DATE,'DD/MM/YYYY'))
INTO v_months_days
FROM DUAL;

-- TO SEPARATE MONTH VALUE OF DAY VALUE
V_MONTHS := TRUNC(V_MONTHS_DAYS);
V_DAYS := MOD(V_MONTHS_DAYS,V_MONTHS);

-- FOR TO OBTAIN THE CORRECT DAY VALUE
SELECT TRUNC(V_AVG_M * trunc(V_DAYS*1000))
INTO V_FORMAT
FROM DUAL;

-- GET ONLY FISRT NUMBER, THAT'S THE NUMBER OF MONTHS
V_MONTHS_DAYS := TRUNC(V_MONTHS_DAYS);

-- TO CONCATENATE THE FINAL MESSAGE 
V_RESULT := V_MONTHS_DAYS||' MONTHS AND '||V_FORMAT||' DAYS';

RETURN (V_RESULT);
END;


-- EXECUTE A TEST
SELECT fct_months_diference(SYSDATE, '01/10/2021') FROM DUAL;
