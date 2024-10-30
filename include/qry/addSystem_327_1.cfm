
<cftry>
    <cfset result = createObject("component", "services.SystemUserService").INSfusystemusers_24477(
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
