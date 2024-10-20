
<cftry>
    <cfset result = createObject("component", "services.AuditionGenreService").updateaudgenres(
        audgenreid = new_audgenreid,
        audgenre = new_audgenre,
        audCatid = new_audCatid,
        isDeleted = new_isDeleted,
        recordname = ""
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audgenres_ins_364_1.cfm]: #cfcatch.message# Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
