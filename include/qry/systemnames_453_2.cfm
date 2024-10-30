
<cftry>
    <cfset systemnames = createObject("component", "/services/SystemService").SELfusystems_24634()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in systemnames_453_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
