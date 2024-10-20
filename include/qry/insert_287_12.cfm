
<cftry>
    <cfset insertResult = createObject("component", "services.GenreAuditionService").insertaudgenres_audition_xref(new_audroleid, new_audgenreid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_287_12.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
