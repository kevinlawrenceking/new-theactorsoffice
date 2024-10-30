
<cftry>
    <cfset cu = createObject("component", "/services/ContactItemService").SELcontactitems_23840(currentid=#currentid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in cu_83_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
