
<cftry>
    <cfset tagsvalid = createObject("component", "/services/TagsUserService").getUserTags(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tagsvalid_542_1.cfm]: #cfcatch.message#">
        <cfset tagsvalid = queryNew("tagname")>
    </cfcatch>
</cftry>
