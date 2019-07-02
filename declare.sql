/*
    PL/SQL이란?
    - Procedural Language / Structured Query Language
    - SQL에 프로그래밍 언어 설계 기능을 절차적으로 추가한 것
    - 데이터 캡슐화, 예외처리, 정보 숨김, 객체 지향 등의 현대 S/W공학 기능 제공
    - SQL문을 블록 구조 및 프로시저 단위 코드에 포함시킬 수 있는 강력한 트랜잭션 처리 언어


    PL/SQL 처리과정
    - 오라클 선행 컴파일러에서 PL/SQL블록을 제출하면 Oracle Server 내의 PL/SQL엔진이 이를 처리한다.
    - PL/SQL 엔진은 블록 내의 SQL문을 분리하여 하나씩 SQL문 실행자로 전송한다.
    - PL/SQL 코드는 Oracle Server에 저장할 수 있으며, 이름 앞에 Stored를 붙여 부른다.
    
    ※ 패키지 확인
    SELECT
            OBJECT_NAME
      FROM  DBA_OBJECTS
     WHERE  OWNER       = 'SYS'
       AND  OBJECT_TYPE = PACKAGE';
    
    
    PL/SQL Block 구조
    ******************************************************************
    DECLARE
            변수 선언문;
    BEGIN
            프로그램 코드;
    EXCEPTION
            예외 처리문;
    END;
    ******************************************************************
    
    - 변수 선언문    :   블럭에서 사용할 변수를 정의. 커서 정의와 중첩된 PL/SQL함수도 여기서 정의.
    - 프로그램 코드  :   블럭을 구성하는 PL/SQL문.
    - 예외처리문     :   런타임 오류나 예외 발생시 트리거 되는 프로그램 코드.
    - 각 블럭에서 문장의 끝을 알리기 위해 반드시 (;)을 붙인다.
    - BEGIN 내에 다른 블럭을 내포할 수 있다.
    
*/

--[예제1] 간단한 작성과 실행
DECLARE
    X   NUMBER;
BEGIN
    X   :=  100;
END;


--[예제2] 결과 출력하기
/*
    - 출력은 DBMS_OUTPUT 패키지가 담당한다.
    - 패키지 안에 DBMS_OUTPUT.PUT_LINE 프로시저 사용.
    - 출력을 SQL*PLUS에서 보려면 SET SERVEROUTPUT ON 을 먼저 실행해야한다
*/
DECLARE
    x   NUMBER;
BEGIN
    x   := 65400;
    DBMS_OUTPUT.PUT_LINE('The variable x = ');
    DBMS_OUTPUT.PUT_LINE(x);
END;   



--[예제3] 함수 작성하기
CREATE OR REPLACE FUNCTION TEST_FUNC
RETURN NUMBER AS
    x   NUMBER;
BEGIN
    x   := 100;
    RETURN x;
END;


-- OR REPLACE는 동일 코드가 있는 경우 덮어쓰기를 하라는 의미이다.

--[결과확인]
SELECT TEST_FUNC FROM DUAL;


-- Anonym us Block (이름 없는 블록)
/*
    - 아무런 이름이 없는 블럭으로 프로시저나 함수, 트리거 본문을 형성하지 않는 블럭
    - DECALRE라는 예약어를 사용하여 시작하고 다음 예약어인 BEGIN 사이에 변수를 선언한다.
    - BEGIN 예약어는 블럭의 절차적 부분이 시작되나는 것을 알려준다. 프로그램 코드가 해당된다.
    - EXCEPTION 예약어는 블럭에서 예외처리 코드를 갖는다.
*/

