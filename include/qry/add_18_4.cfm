<!--- This ColdFusion page handles the insertion of contact details into the database. --->

<cfquery name="add" result="result">
    <!--- Insert a new contact detail into the contactdetails table for the specified user. --->
    INSERT INTO contactdetails (userid, contactFullName) 
    VALUES (#userid#, '#relationship#');
</cfquery>
