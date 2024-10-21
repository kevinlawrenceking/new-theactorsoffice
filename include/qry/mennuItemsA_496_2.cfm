

<cftry>
    <cfset mennuItemsa = createObject("component", "/services/ComponentService").getpgcomps()>

    <cfcatch type="any"><cfoutput>
 [Error in mennuItemsa_496_2.cfm]:  #cfcatch.message#</cfoutput>
    </cfcatch>
</cftry>
