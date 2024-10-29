
<cftry>
    <cfset Finddetails = createObject("component", "services.PageService").getPgDirByPgid(pgid=#pgid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Finddetails_185_1.cfm]: #cfcatch.message#">
        <cfthrow message="Fetch operation failed." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
