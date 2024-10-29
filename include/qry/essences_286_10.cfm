
<cftry>
    <cfset essences = createObject("component", "/services/EssenceService").getEssencesByUserId(userid=#userid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in essences_286_10.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
