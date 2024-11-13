<Cfparam name="pass1" default="" />


    
    
    
    
<cfset new_passwordSalt=hash(generateSecretKey("AES"),"SHA-512") />



<cfquery result="result"  name="Del" >
UPDATE taousers_tbl set isdeleted = 1 where customerid =
<cfquery result="result" param value="#id#" cfsqltype="cf_sql_integer" />
</cfquery >

<cfquery name="insert"  result="result">
INSERT INTO taousers (customerid,userfirstName,userLastName,userEmail,avatarname,passwordHash,passwordSalt)
VALUES (
<cfquery result="result" param value="#id#" cfsqltype="cf_sql_integer" />

,
<cfquery result="result" param value="#customerfirst#" cfsqltype="cf_sql_varchar" />
,
<cfquery result="result" param value="#customerlast#" cfsqltype="cf_sql_varchar" />
,
<cfquery result="result" param value="#customeremail#" cfsqltype="cf_sql_varchar" />
,
<cfquery result="result" param value="#customerfirst#" cfsqltype="cf_sql_varchar" />
,
<cfquery result="result" param cfsqltype="char" value="#hash(pass1 & new_passwordSalt,'SHA-512')#" />
,
<cfquery result="result" param cfsqltype="char" value="#new_passwordSalt#" />
)

</cfquery>





<cfset select_userid=result.generatedkey />

    <cfinclude template="/sched/user_setup_core.cfm" />


<cfquery result="result"  name="update" >
    UPDATE thrivecart
    set status =
    <cfquery result="result" param cfsqltype="cf_sql_varchar" value="Completed" />
    where id = #id#
</cfquery>


    <cflocation url="setup-complete.cfm?userid=#select_userid#" />
