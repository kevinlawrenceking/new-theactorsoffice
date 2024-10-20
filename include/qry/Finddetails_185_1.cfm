
<cftry>
    <cfset Finddetails = new services.PageService().getpgpages(pgid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Finddetails_185_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
