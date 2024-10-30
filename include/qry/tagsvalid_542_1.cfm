
<cftry>
    <cfset tagsvalid = createObject("component", "services.TagsUserService").SELtags_user_24765(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tagsvalid_542_1.cfm]: #cfcatch.message#">
        <cfset tagsvalid = queryNew("tagname")>
    </cfcatch>
</cftry>
