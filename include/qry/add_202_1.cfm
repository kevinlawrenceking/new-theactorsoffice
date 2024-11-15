<!--- This ColdFusion page handles the insertion of contact details into the database. --->

<cfquery name="add" result="result">
    <!--- Insert a new contact detail into the contactdetails_tbl table. --->
    INSERT INTO contactdetails_tbl (userid, contactfullname) 
    VALUES (#userid#, '#TRIM(contactfullname)#')
</cfquery>
