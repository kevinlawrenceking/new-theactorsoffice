
<cftry>
    <cfset result = createObject("component", "services.AuditionGenreService").insertaudgenres(
        audgenre=new_audgenre,
        audCatid=new_audCatid,
        recordname=""
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 if needed --->
<cfcatch>
    <cflog file="errorLog" text="[Error in audgenres_ins_362_1.cfm] #cfcatch.message# - #cfcatch.detail#">
</cfcatch>
</cftry>
