
<cftry>
    <cfset objService = createObject("component", "services.AuditionDialectsUserService")>
    <cfset objService.insertAuddialectsUser(CustomDialect=CustomDialect, new_catid=new_catid, userid=userid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_287_24.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling insertAuddialectsUser.">
    </cfcatch>
</cftry>
