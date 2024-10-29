
<cftry>
    <cfset variables.systemUserService = createObject("component", "/services/SystemUserService")>
    <cfset variables.systemUserService.insertSystemUser(
        maint_systemID = maint_systemID,
        maint_contactID = maint_contactID,
        userid = userid,
        suStartDate = suStartDate
    )>
    <cfquery datasource="abod">
        UPDATE someTable SET isfetch = 1 WHERE condition = true
    </cfquery>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addSystem_315_34.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
