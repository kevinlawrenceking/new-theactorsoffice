
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc" />
    <cfset results = contactItemService.getcontactitems(uploadid) />
    
    <!--- Save the modified file and update the database to set isfetch = 1 --->
    <!--- Example: Update query to set isfetch = 1 for the specific upload ID --->
    <cfquery>
        UPDATE your_table_name
        SET isfetch = 1
        WHERE uploadid = <cfqueryparam value="#uploadid#" cfsqltype="CF_SQL_INTEGER" />
    </cfquery>

<cfcatch type="any">
    <cfset errorLog = "[Error in results_142_1.cfm]: " & cfcatch.message />
    <!--- Log the error or handle it appropriately --->
</cfcatch>
</cftry>
