
<cftry>
    <cfset FindKey = createObject("component", "services.PageFieldService").getpgfields(pgid=pgid, updatename="ID")>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindKey_466_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
