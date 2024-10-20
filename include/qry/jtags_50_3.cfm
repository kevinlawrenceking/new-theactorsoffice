
<cftry>
    <cfset jtags = createObject("component", "/services/TagsUserService").gettags_user(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in jtags_50_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
