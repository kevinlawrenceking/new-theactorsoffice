
<cftry>
    <cfset systemUserService = createObject("component", "services.SystemUserService")>
    <cfset systemUserService.INSfusystemusers(
        new_systemid = new_systemid,
        new_contactid = new_contactid,
        new_suStartDate = new_suStartDate
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addSystem_5_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error inserting system user." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
