<!--- This ColdFusion page retrieves contact details based on a list of contact IDs. --->

<cfquery name="BatchDetails">
    <!--- Query to select contact ID and record name from contact details table --->
    SELECT 
        contactid,
        recordname 
    FROM 
        contactdetails d 
    WHERE 
        d.contactid IN (#idlist#)
</cfquery>
