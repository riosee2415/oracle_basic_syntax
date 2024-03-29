/*
    PROCEDURE
    - 특정 작업을 수행하는, 이름이 있는 PL/SQL이다.
    매개 변수를 받을 수 있고, 반복적으로 사용할 수 있는 BLOCK이다.
    보통 연속 실행 또는 구현이 복잡한 트랜잭션을 수행하는 PL/SQL BLOCK을 데이터베이스에 저장하기 위해 생성한다
*/

/*
    사용문법
    CREATE OR REPLACE PROCEDURE #procedure_name#
        IN      argument
        OUT     argument
        INOUT   argument
    IS
        [변수의 선언]
    BEGIN   >> 필수
        [PL/SQL Block]
            : SQL문장, PL/SQL제어 문장
            
        [EXCEPTION]
            : error가 발생할 때 수행하는 문장
            
    END;    >> 필수
*/

CREATE OR REPLACE PROCEDURE update_sal
(
    v_empno    IN  NUMBER
)
IS
BEGIN
    UPDATE emp
    SET sal = sal * 1.1
     WHERE empno = v_empno;
    COMMIT;
END update_sal;   


-- 프로시져 실행
EXECUTE update_sal(7369);


SELECT * FROM EMP WHERE empno=7369;      





                                                                                              
