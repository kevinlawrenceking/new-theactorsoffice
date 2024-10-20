
<cftry>
    <cfset FindKey = createObject("component", "services.PageFieldService").getpgfields(rpgid, "ID")>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindKey_228_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
