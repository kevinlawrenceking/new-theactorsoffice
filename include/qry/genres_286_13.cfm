
<cftry>
    <cfset filters = { "userid" = userid, "audcatid" = new_audcatid }>
    <cfset orderBy = "audgenre">
    <cfset genres = createObject("component", "services.AuditionGenreUserService").getaudgenres_user(filters=filters, orderBy=orderBy)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in genres_286_13.cfm]: #cfcatch.message# - #cfcatch.detail#">
</cfcatch>
</cftry>
