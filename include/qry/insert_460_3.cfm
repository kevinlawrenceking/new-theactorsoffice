
<cftry>
    <cfset result = createObject("component", "/services/PanelsUserXRefService").insertpgpanels_user_xref(newpnid, newuserid)>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <cfquery>
        UPDATE your_table_name SET isfetch = 1 WHERE some_condition
    </cfquery>
<cfcatch type="any">
    <cfset errorLog = "[Error in insert_460_3.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
