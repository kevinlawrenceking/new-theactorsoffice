<!--- This ColdFusion page retrieves error messages from the auditions import error table based on a specific ID. --->

<cfquery name="errs">
    <!--- Query to select error messages from the auditionsimport_error table based on the provided ID --->
    SELECT error_msg 
    FROM auditionsimport_error 
    WHERE id = <cfqueryparam value="#results.id#" cfsqltype="CF_SQL_INTEGER">
</cfquery>
