
<cftry>
    <cfset getRecord = createObject("component", "services.AuditionImportService").SELauditionsimport(id=id)>
    <cfcatch type="any">
        <cflog text="[Error in getRecord_132_1.cfm]: #cfcatch.message#" file="errorLog">
    </cfcatch>
</cftry>
