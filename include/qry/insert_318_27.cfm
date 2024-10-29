
<cftry>
    <cfset tagsUserService = createObject("component", "services.TagsUserService")>
    <cfset tagsUserService.insertTagUser(
        tagname = x.tagname,
        userid = users.userid,
        tagtype = x.tagtype
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_318_27.cfm]: #cfcatch.message#">
        <cfthrow message="Error calling insertTagUser function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
