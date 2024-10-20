
<cftry>
    <cfset result = createObject("component", "services.AuditionMediaXRefService").insertaudmedia_auditions_xref(new_mediaid, audprojectid)>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming you have a function or query to update the database here --->
    <!--- Example: updateDatabaseFunction(isfetch) --->
<cfcatch type="any">
    <cfset errorLog = "[Error in linkmedia_152_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
