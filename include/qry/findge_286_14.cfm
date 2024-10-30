
<cftry>
    <cfset findge = createObject("component", "services.GenreAuditionService").SELaudgenres_audition_xref_24274(
        audgenre=genres.audgenre,
        audroleid=audroleid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findge_286_14.cfm] #cfcatch.message#">
        <cfthrow message="Error executing fetch in findge_286_14.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
