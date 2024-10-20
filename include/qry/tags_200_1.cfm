
<cftry>
    <cfset tags = createObject("component", "services.TagsUserService").gettags_user(userid=userid, tagtypes=tagtypes)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in tags_200_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
