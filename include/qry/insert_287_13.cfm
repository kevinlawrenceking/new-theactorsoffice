
<cftry>
    <cfset objService = createObject("component", "services.AuditionGenreUserService")>
    <cfset objService.INSaudgenres_user(new_genre=new_genre, new_catid=new_catid, userid=userid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_287_13.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INSaudgenres_user." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
