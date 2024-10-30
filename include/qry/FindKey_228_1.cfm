
<cftry>
    <cfset FindKey = createObject("component", "services.PageFieldService").SELpgfields_24115(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindKey_228_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
