
<cftry>
    <cfset tagsUserService = createObject("component", "services.TagsUserService")>
    <cfset FindScope = tagsUserService.getContactIdByTag(new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindScope_304_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
