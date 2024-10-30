
<!--- This ColdFusion page retrieves the first name from the pgfields table based on the provided page ID and update name. --->
<cftry>
    <cfset FindKey = createObject("component", "services.PageFieldService").SELpgfields(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindKey_185_3.cfm]: #cfcatch.message#">
        <cfset FindKey = queryNew("fname")>
    </cfcatch>
</cftry>
