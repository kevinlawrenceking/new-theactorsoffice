<!--- This ColdFusion page retrieves all records from the audlinks table based on the provided audroleid. --->

<cfquery name="audlinks">
    <!--- Query to select all records from audlinks where the audroleid matches the provided value. --->
    SELECT * 
    FROM audlinks 
    WHERE audroleid = #audroleid#
</cfquery>
