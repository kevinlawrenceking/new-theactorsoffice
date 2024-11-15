<!--- This ColdFusion page retrieves user information based on the provided user ID. --->

<cfquery name="u">
    <!--- Query to select all fields from the taousers table where the userid matches the provided userid variable. --->
    SELECT * 
    FROM taousers 
    WHERE userid = #userid#
</cfquery>
