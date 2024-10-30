
<cftry>
    <cfset imports = createObject("component", "services.ContactImportService").SELcontactsimport_24668(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in imports_485_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
