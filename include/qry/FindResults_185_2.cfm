
<cftry>
    <cfset FindResults = createObject("component", "/services/PageService").getDynamicQuery(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog type="error" text="[Error in FindResults_185_2.cfm]: #cfcatch.message#">
        <cfthrow type="DatabaseError" message="An error occurred while fetching data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
