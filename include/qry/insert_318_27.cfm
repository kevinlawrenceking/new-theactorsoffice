
<!--- This ColdFusion page handles the insertion of user tags into the tags_user table. --->
<cftry>
    <cfset objTagsUserService = createObject("component", "services.TagsUserService")>
    <cfset objTagsUserService.INStags_user_24458(
        tagname = x.tagname,
        userid = users.userid,
        tagtype = x.tagtype
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_318_27.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
