
<cftry>
    <cfset objService = createObject("component", "services.AuditionGenreUserService")>
    <cfset objService.insertAudgenresUser(new_genre=new_genre, new_catid=new_catid, userid=userid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_287_13.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while inserting audio genre." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
