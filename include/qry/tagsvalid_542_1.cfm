
<cftry>
    <cfset tagsvalid = createObject("component", "services.TagsUserService").gettags_user(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in tagsvalid_542_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
