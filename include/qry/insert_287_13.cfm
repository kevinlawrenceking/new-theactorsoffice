
<cftry>
    <cfset result = createObject("component", "services.AuditionGenreUserService").insertaudgenres_user(
        audgenreid = 0, 
        audgenre = new_genre, 
        audCatid = new_catid, 
        userid = userid, 
        isDeleted = false, 
        recordname = ""
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_287_13.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
