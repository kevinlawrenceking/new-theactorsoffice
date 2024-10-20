
<cftry>
    <cfset result = createObject("component", "/services/SystemUserService").insertfusystemusers(
        systemID = new_systemid,
        contactID = new_contactid,
        userID = new_userid,
        suStartDate = suStartDate,
        sunotes = sunotes
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in addSystem_157_3.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
