
<cftry>
    <cfset result = createObject("component", "/services/SystemUserService").insertfusystemusers(
        systemID = maint_systemID, 
        contactID = maint_contactID, 
        userID = userid, 
        suStartDate = suStartDate
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in addSystem_315_34.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
