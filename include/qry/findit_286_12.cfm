
<cftry>
    <cfset filters = { "audcatid" = new_audcatid, "userid" = userid }>
    <cfset findit = createObject("component", "/services/AuditionGenreUserService").getaudgenres_user(filters=filters)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in findit_286_12.cfm]: #cfcatch.message# - #cfcatch.detail#">
</cfcatch>
</cftry>
