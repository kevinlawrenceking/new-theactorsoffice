
<cftry>
    <cfset Finddetails = createObject("component", "/services/PageService").getPgdirByPgid(details_pgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Finddetails_266_4.cfm]: #cfcatch.message#">
        <cfset Finddetails = queryNew("pgdir")>
    </cfcatch>
</cftry>
