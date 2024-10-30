
<cftry>
    <cfset tag = createObject("component", "/services/ContactImportService").SELcontactsimport_24405(new_uploadid=new_uploadid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tag_315_12.cfm]: #cfcatch.message#" />
        <cfthrow />
    </cfcatch>
</cftry>
