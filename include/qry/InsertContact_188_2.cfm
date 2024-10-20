
<cftry>
    <cfset result = createObject("component", "services.UserService").updatetaousers(FindUser.userfirstname, session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in InsertContact_188_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
