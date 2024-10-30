
<cftry>
    <cfset tag = createObject("component", "services.ContactImportService").SELcontactsimport_24407(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tag_315_14.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving contacts import data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
