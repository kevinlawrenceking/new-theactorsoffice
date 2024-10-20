
<cftry>
    <cfset result = createObject("component", "services.SystemUserService").insertfusystemusers(
        systemID = new_systemid,
        contactID = new_contactid,
        userID = session.userid,
        suStartDate = new_suStartDate,
        suNotes = "Added via user batch update"
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in addSystem_5_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
