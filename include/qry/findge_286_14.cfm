
<cftry>
    <cfset findge = createObject("component", "services.GenreAuditionService").getaudgenres_audition_xref(
        essencename = genres.audgenre,
        audroleid = audroleid,
        userid = session.userid
    )>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in findge_286_14.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
