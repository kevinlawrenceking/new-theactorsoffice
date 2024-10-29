
<cftry>
    <cfset FindSystem = createObject("component", "services.SystemService").getFilteredSystems(systemtype=new_systemtype, systemscope=new_systemscope) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindSystem_294_6.cfm]: #cfcatch.message#" />
        <cfthrow message="An error occurred while retrieving systems. Please try again later." />
    </cfcatch>
</cftry>
