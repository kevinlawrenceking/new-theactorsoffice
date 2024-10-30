
<cftry>
    <cfset maints = createObject("component", "services.ContactImportService").SELcontactsimport_24425(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in maints_315_32.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
