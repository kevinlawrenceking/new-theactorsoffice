<!--- This ColdFusion page retrieves contact details for a specific user from the database and orders them by contact fullname. --->

<cfquery name="refers">
    <!--- Query to select all contact details for the given user ID, ordered by contact fullname --->
    SELECT * 
    FROM contactdetails 
    WHERE userid = #userid# 
    ORDER BY contactfullname
</cfquery>
