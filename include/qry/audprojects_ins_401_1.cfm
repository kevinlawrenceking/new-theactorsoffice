
<cftry>
    <cfset result = createObject("component", "services.AuditionProjectService").updateaudprojects(
        new_projName = new_projName,
        new_projDescription = new_projDescription,
        new_unionID = new_unionID,
        new_networkID = new_networkID,
        new_toneID = new_toneID,
        new_contractTypeID = new_contractTypeID,
        new_contactid = new_contactid,
        new_audprojectID = new_audprojectID
    ) />
    <cfset isfetch = 1 />
<cfcatch type="any">
    <cfset errorLog = "[Error in audprojects_ins_401_1.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
