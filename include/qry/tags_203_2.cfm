
<cftry>
    <cfset tags = createObject("component", "services.TagsUserService").gettags_user(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in tags_203_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
