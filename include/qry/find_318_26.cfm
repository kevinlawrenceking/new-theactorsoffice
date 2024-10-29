
<cftry>
    <cfset find = createObject("component", "services.TagsUserService").getTagsUser(tagname=x.tagname, userid=users.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_318_26.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching data in find_318_26.cfm." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
