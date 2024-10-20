
<cftry>
    <cfset y = createObject("component", "services.TagsUserService").gettags_user(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in y_298_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
