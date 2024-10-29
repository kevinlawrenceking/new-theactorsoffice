
<cftry>
    <cfset tagsUserService = new "/services/TagsUserService.cfc"()>
    <cfset tagsUserService.insertTagUser(userid=userid, new_valuetext=new_valuetext)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_tag_298_3.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
