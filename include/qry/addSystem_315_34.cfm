
<cftry>
    <cfset systemUserService = new "/services/SystemUserService.cfc"()>
    <cfset systemUserService.INSfusystemusers_24427(
        maint_systemID = maint_systemID,
        maint_contactID = maint_contactID,
        userid = userid,
        suStartDate = suStartDate
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addSystem_315_34.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
