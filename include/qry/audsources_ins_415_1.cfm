
<cftry>
    <cfset result = createObject("component", "services.AuditionSourceService").insertaudsources(
        new_audsource = trim(new_audsource),
        new_isDeleted = trim(new_isDeleted)
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audsources_ins_415_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
