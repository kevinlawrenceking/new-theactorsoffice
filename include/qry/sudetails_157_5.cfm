
<cftry>
    <cfset sudetails = createObject("component", "services.SystemService").DETfusystems(systemId=new_systemid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in sudetails_157_5.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching system details" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
