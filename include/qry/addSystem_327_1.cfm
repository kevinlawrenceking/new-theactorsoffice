
<cftry>
    <cfset result = createObject("component", "services.SystemUserService").insertfusystemusers(
        systemID = systemID,
        contactID = contactID,
        userID = userid,
        suStartDate = suStartDate
    )>
    <cfcatch>
        <cfset errorLog = "[Error in addSystem_327_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
