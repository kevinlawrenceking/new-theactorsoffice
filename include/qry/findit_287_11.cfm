
<cftry>
    <cfset findit = createObject("component", "services.AuditionGenreUserService").getAudGenreId(new_genre=new_genre, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findit_287_11.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while fetching audgenreid.">
    </cfcatch>
</cftry>
