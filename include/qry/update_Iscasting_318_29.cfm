
<cftry>
    <cfset result = new services.TagsUserService().updatetags_user(select_userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_Iscasting_318_29.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
