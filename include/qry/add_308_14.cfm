<!--- This ColdFusion page handles the insertion of contact details into the database. --->

<cfquery name="add" result="result">
    <!--- Insert a new record into the contactdetails table with user ID and full name. --->
    INSERT INTO contactdetails (userid, contactFullName)
    VALUES (#userid#, '#cdfullname#');
</cfquery>
