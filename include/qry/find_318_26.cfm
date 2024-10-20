
<cftry>
    <cfset find = createObject("component", "services.TagsUserService").gettags_user(tagname=x.tagname, userid=users.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_318_26.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
