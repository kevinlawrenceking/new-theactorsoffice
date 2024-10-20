
<cftry>
    <cfset result = createObject("component", "/services/TagsUserService").updatetags_user(userid=userid, tagname=left(y.tagname, 40))>
    <cfcatch type="any">
        <cfset errorLog = "[Error in d_298_8.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
