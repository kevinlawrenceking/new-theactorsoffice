
<cftry>
    <cfset tag = createObject("component", "services.ContactImportService").SELcontactsimport_24403(new_uploadid=new_uploadid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tag_315_10.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
