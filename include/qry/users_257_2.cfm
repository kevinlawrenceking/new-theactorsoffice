<!--- This ColdFusion page retrieves user information based on the provided user ID. --->

<cfquery name="users">
    <!--- Query to select all fields from taousers where the userid matches the provided userid variable. --->
    Select * 
    from taousers 
    where userid = #userid#
</cfquery>
