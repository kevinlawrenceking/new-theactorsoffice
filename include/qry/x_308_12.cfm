
<cftry>
    <cfset x = createObject("component", "services.AuditionImportService").SELauditionsimport_24363(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_308_12.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
