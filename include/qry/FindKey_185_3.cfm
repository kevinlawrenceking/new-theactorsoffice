
<cftry>
    <cfset FindKey = createObject("component", "services.PageFieldService").getFnameByPgid(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindKey_185_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
