
<cftry>
    <cfset tagsUserService = new "/services/TagsUserService.cfc"()>
    <cfset tagsUserService.UPDtags_user_24460(select_userid=select_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_Iscasting_318_29.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating Iscasting status.">
    </cfcatch>
</cftry>
