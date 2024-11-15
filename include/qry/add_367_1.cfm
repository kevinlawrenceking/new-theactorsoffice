<!--- This ColdFusion page handles the insertion of contact details into the database. --->

<cfquery name="add" result="result">
    <!--- Insert a new contact detail into the contactdetails table. --->
    INSERT INTO contactdetails (userid, contactfullname) 
    VALUES (#userid#, '#cdfullname#');
</cfquery>
