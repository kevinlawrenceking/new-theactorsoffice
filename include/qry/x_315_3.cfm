
<cftry>
    <cfset x = createObject("component", "services.ContactImportService").SELcontactsimport(uploadId=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_315_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
