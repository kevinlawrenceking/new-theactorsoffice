
<cftry>
    <cfset FindJoins = createObject("component", "/services/PageService").SELpgpages_24740(pgid=#pgid#)>
    <cfcatch type="any">
        <cflog text="[Error in FindJoins_526_3.cfm]: #cfcatch.message#" file="errorLog">
        <cfthrow type="DatabaseError" message="An error occurred while fetching data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
