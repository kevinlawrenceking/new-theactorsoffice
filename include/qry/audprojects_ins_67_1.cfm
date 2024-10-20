
<cftry>
    <cfset result = createObject("component", "/services/AuditionProjectService").updateaudprojects(
        new_audSubCatID = new_audSubCatID,
        new_audprojectID = new_audprojectID
    )>
    <cfset isfetch = 1>
    <!--- Save the modified file and update the database to set isfetch = 1 --->
<cfcatch type="any">
    <cfset errorLog = "[Error in audprojects_ins_67_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
