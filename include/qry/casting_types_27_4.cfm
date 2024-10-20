
<cftry>
    <cfset casting_types = createObject("component", "services.TagsUserService").gettags_user(userid=userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in casting_types_27_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
