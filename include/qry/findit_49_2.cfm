
<cftry>
    <cfset filters = {audcatid = audcatid, userid = userid}>
    <cfset findit = createObject("component", "/services/AuditionGenreUserService").getaudgenres_user(filters=filters)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findit_49_2.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
