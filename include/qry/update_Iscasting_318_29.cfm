
<cftry>
    <cfset tagsUserService = new services.TagsUserService()>
    <cfset tagsUserService.updateTagsUser(select_userid=select_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_Iscasting_318_29.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating Iscasting status.">
    </cfcatch>
</cftry>
