-- Start of DDL Script for Procedure ADMIN_HIDE.SPCUSTOMER_DELETE
-- Generated 08-Mar-2021 09:56:23 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spcustomer_delete(
    --Input
    aid_customer_input             in  number
    --Return OUT
) as
    vcheck number(10);
begin
    -----------------------------Check ton tai
    select count(1)
        into    vcheck
        from    admin_hide_customer c
        where   c.aid_customer = aid_customer_input;
    -----------------------------Khong ton tai ban ghi thi return
    if (vcheck=0) then
        return;
    end if;
    -----------------------------Delete
    delete from admin_hide_customer c
        where c.aid_customer=aid_customer_input;
    -----------------------------Delete thanh cong

    -----------------------------Ngoai le
exception
    when others then
        rollback;

end;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPCUSTOMER_DELETE

-- Start of DDL Script for Procedure ADMIN_HIDE.SPCUSTOMER_GET
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spcustomer_get(
   c_Customer  OUT SYS_REFCURSOR
  ) IS
BEGIN
   OPEN c_Customer FOR
    select t.aid_customer,t.aname_customer,t.aemail,t.aaddress,t.anumber_phone  from admin_hide_customer t;

END;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPCUSTOMER_GET

-- Start of DDL Script for Procedure ADMIN_HIDE.SPCUSTOMER_INSERT
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spcustomer_insert        (
    aNAME_CUSTOMER          in       varchar2,
    aEMAIL                  in       varchar2,
    aADDRESS                in varchar2,
    aNUMBER_PHONE           in number
    )

 as
begin
    -----------------------------Insert
    insert into admin_hide_customer c    (
    c.aid_customer,c.aname_customer,c.aemail,c.aaddress,c.anumber_phone
     )

 VALUES (sqcustomer_add.NEXTVAL,aNAME_CUSTOMER,aEMAIL,aADDRESS,aNUMBER_PHONE);
    -----------------------------Insert thanh cong

    -----------------------------Ngo?i l?
exception
    when others then
        rollback;

end;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPCUSTOMER_INSERT

-- Start of DDL Script for Procedure ADMIN_HIDE.SPCUSTOMER_SEARCH
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spcustomer_search(
    aid_customer_input            in number,
    aNAME_CUSTOMER_input          in varchar2,
   c_admin_hide_customer  OUT SYS_REFCURSOR
  ) IS
BEGIN
   OPEN c_admin_hide_customer FOR
    select * from admin_hide_customer c
where c.aid_customer=aid_customer_input or c.aname_customer=aNAME_CUSTOMER_input;
END;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPCUSTOMER_SEARCH

-- Start of DDL Script for Procedure ADMIN_HIDE.SPCUSTOMER_UPDATE
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spcustomer_update(
    --Input
    aid_customer_input            in number,
    aNAME_CUSTOMER_input          in varchar2,
    aEMAIL_input                  in varchar2,
    aADDRESS_input                in varchar2,
    aNUMBER_PHONE_input           in number
) as
begin
    UPDATE admin_hide_customer c
SET c.aname_customer=aNAME_CUSTOMER_input,c.aemail=aEMAIL_input,c.aaddress=aADDRESS_input,c.anumber_phone=aNUMBER_PHONE_input
where c.aid_customer = aid_customer_input;
end;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPCUSTOMER_UPDATE

-- Start of DDL Script for Procedure ADMIN_HIDE.SPPRODUCT_DELETE
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spproduct_delete(
    --Input
    aid_product_input             in  number
    --Return OUT
) as
    vcheck number(10);
begin
    -----------------------------Check ton tai
    select count(1)
        into    vcheck
        from    admin_hide_product p
        where   p.aid_product=aid_product_input;
    -----------------------------Khong ton tai ban ghi thi return
    if (vcheck=0) then
        return;
    end if;
    -----------------------------Delete
    delete from admin_hide_product p
        where p.aid_product=aid_product_input;
    -----------------------------Delete thanh cong

    -----------------------------Ngoai le
exception
    when others then
        rollback;

end;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPPRODUCT_DELETE

-- Start of DDL Script for Procedure ADMIN_HIDE.SPPRODUCT_GET
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spproduct_get(
   c_admin_hide_product  OUT SYS_REFCURSOR
  ) IS
BEGIN
   OPEN c_admin_hide_product FOR
    select t.aid_product,t.aname_product,t.aprice,t.adescride,t.adiscount,t.adate_start,t.adate_end,t.aimages  from admin_hide_product t;

END;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPPRODUCT_GET

-- Start of DDL Script for Procedure ADMIN_HIDE.SPPRODUCT_INSERT
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spproduct_insert        (
    aname_product_input             in       varchar2,
    aprice_input                    in number,
    adescride_input                 in varchar2,
    adiscount_input                 in number,
    adate_start_input               in date,
    adate_end_input                 in date,
    aimages_input                   in varchar2
    )
as
begin
    -----------------------------Insert
    insert into admin_hide_product p    (
    p.aid_product,p.aname_product,p.aprice,p.adescride,p.adiscount,p.adate_start,p.adate_end,p.aimages
     )

 VALUES (sqproduct_insert.NEXTVAL,aname_product_input,aprice_input,adescride_input,adiscount_input,adate_start_input,adate_end_input,aimages_input);
    -----------------------------Insert thanh cong

    -----------------------------Ngo?i l?
exception
    when others then
        rollback;

end;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPPRODUCT_INSERT

-- Start of DDL Script for Procedure ADMIN_HIDE.SPPRODUCT_SEARCH
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spproduct_search(
    aid_product_input            in number,
    aNAME_product_input          in varchar2,
    aprice_input                 in number,
   c_admin_hide_product  OUT SYS_REFCURSOR
  ) IS
BEGIN
   OPEN c_admin_hide_product FOR
    select * from admin_hide_product p
where p.aid_product=aid_product_input or p.aname_product=aNAME_product_input or p.aprice = aprice_input;

END;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPPRODUCT_SEARCH

-- Start of DDL Script for Procedure ADMIN_HIDE.SPPRODUCT_UPDATE
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spproduct_update(
    --Input
    aid_product_input               in number,
    aname_product_input             in varchar2,
    aprice_input                    in number,
    adescride_input                 in varchar2,
    adiscount_input                 in number,
    adate_start_input               in date,
    adate_end_input                 in date,
    aimages_input                   in varchar2

) as
begin
    UPDATE admin_hide_product p
SET p.aname_product=aname_product_input,p.aprice=aprice_input,p.adescride=adescride_input,
    p.adiscount=adiscount_input,p.adate_start=adate_start_input,p.adate_end=adate_end_input,p.aimages=aimages_input
where p.aid_product=aid_product_input;

end;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPPRODUCT_UPDATE

-- Start of DDL Script for Procedure ADMIN_HIDE.SPSTAFF_DELETE
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spstaff_delete(
    --Input
    aid_staff_input             in  number
    --Return OUT
) as
    vcheck number(10);
begin
    -----------------------------Check ton tai
    select count(1)
        into    vcheck
        from    admin_hide_staff c
        where   c.aid_staff = aid_staff_input;
    -----------------------------Khong ton tai ban ghi thi return
    if (vcheck=0) then
        return;
    end if;
    -----------------------------Delete
    delete from admin_hide_staff c
        where c.aid_staff=aid_staff_input;
    -----------------------------Delete thanh cong

    -----------------------------Ngoai le
exception
    when others then
        rollback;

end;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPSTAFF_DELETE

-- Start of DDL Script for Procedure ADMIN_HIDE.SPSTAFF_GET
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spstaff_get(
   c_admin_hide_staff  OUT SYS_REFCURSOR
  ) IS
BEGIN
   OPEN c_admin_hide_staff FOR
    select t.aid_staff,t.aname_staff,t.aemail,t.aaddress,t.anumber_phone  from admin_hide_staff t;

END;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPSTAFF_GET

-- Start of DDL Script for Procedure ADMIN_HIDE.SPSTAFF_INSERT
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spstaff_insert        (
    aNAME_staff          in       varchar2,
    aEMAIL                  in       varchar2,
    aADDRESS                in varchar2,
    aNUMBER_PHONE           in number
    )

 as
begin
    -----------------------------Insert
    insert into admin_hide_staff c    (
    c.aid_staff,c.aname_staff,c.aemail,c.aaddress,c.anumber_phone
     )

 VALUES (sqstaff_insert.NEXTVAL,aNAME_staff,aEMAIL,aADDRESS,aNUMBER_PHONE);
    -----------------------------Insert thanh cong

    -----------------------------Ngo?i l?
exception
    when others then
        rollback;

end;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPSTAFF_INSERT

-- Start of DDL Script for Procedure ADMIN_HIDE.SPSTAFF_SEARCH
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spstaff_search(
    aid_staff_input            in number,
    aNAME_staff_input          in varchar2,
   c_admin_hide_staff  OUT SYS_REFCURSOR
  ) IS
BEGIN
   OPEN c_admin_hide_staff FOR
    select * from admin_hide_staff c
where c.aid_staff=aid_staff_input or c.aname_staff=aNAME_staff_input;
END;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPSTAFF_SEARCH

-- Start of DDL Script for Procedure ADMIN_HIDE.SPSTAFF_UPDATE
-- Generated 08-Mar-2021 09:56:24 from ADMIN_HIDE@XE

CREATE OR REPLACE 
PROCEDURE spstaff_update(
    --Input
    aid_staff_input            in number,
    aNAME_staff_input          in varchar2,
    aEMAIL_input                  in varchar2,
    aADDRESS_input                in varchar2,
    aNUMBER_PHONE_input           in number
) as
begin
    UPDATE admin_hide_staff c
SET c.aname_staff=aNAME_staff_input,c.aemail=aEMAIL_input,c.aaddress=aADDRESS_input,c.anumber_phone=aNUMBER_PHONE_input
where c.aid_staff = aid_staff_input;
end;
/



-- End of DDL Script for Procedure ADMIN_HIDE.SPSTAFF_UPDATE

