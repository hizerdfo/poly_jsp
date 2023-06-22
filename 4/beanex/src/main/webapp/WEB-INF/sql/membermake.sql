drop table member; 


create table member (
    id varchar2(20), 
    pw varchar2(20), 
    name varchar2(20), 
    phone varchar2(20)
);

insert into member(id, pw, name, phone) values ('abc','123','홍길동','010-1234-5678');
insert into member(id, pw, name, phone) values ('def','456','홍길순','010-2234-5678');
insert into member(id, pw, name, phone) values ('ghi','789','홍길이','010-1111-2222');
insert into member(id, pw, name, phone) values ('jkl','234','홍길남','010-3333-4444');

SELECT id, pw, name, phone FROM member;