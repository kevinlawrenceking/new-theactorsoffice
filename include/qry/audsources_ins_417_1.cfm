
<cftry>
    <cfset result = createObject("component", "services.AuditionSourceService").updateaudsources(
        new_audsource = new_audsource,
        new_isDeleted = new_isDeleted,
        new_audsourceid = new_audsourceid
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audsources_ins_417_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
