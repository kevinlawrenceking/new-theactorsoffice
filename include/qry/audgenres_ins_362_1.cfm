
<cftry>
    <cfset result = createObject("component", "services.AuditionGenreService").insertAudGenre(
        new_audgenre = trim(new_audgenre),
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audgenres_ins_362_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
