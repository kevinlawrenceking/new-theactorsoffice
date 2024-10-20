
<cftry>
    <cfset filters = {audgenre=new_genre, userid=userid}>
    <cfset findit = createObject("component", "/services/AuditionGenreUserService").getaudgenres_user(filters=filters, orderBy="audgenreid")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findit_287_11.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
