
<cftry>
    <cfset findge = createObject("component", "services.GenreAuditionService").getAuditionGenres(
        audgenre=genres.audgenre,
        audroleid=audroleid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findge_286_14.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching data in findge_286_14.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
