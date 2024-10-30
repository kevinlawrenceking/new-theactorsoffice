
<cftry>
    <cfset audgenres_audition_xref = createObject("component", "services.AuditionGenreUserService").SELaudgenres_user_24523(audroleid=audroleid, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audgenres_audition_xref_359_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
