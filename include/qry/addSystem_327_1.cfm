
<cftry>
    <cfset variables.systemUserService = createObject("component", "/services/SystemUserService")>
    <cfset variables.systemUserService.insertSystemUser(
        systemID = systemID,
        contactID = contactID,
        userID = userid,
        suStartDate = suStartDate
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addSystem_327_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
