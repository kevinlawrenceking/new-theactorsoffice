
<cftry>
    <cfset findscope = createObject("component", "/services/ContactItemService").SELcontactitems_24761(contactid=#contactid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findscope_539_2.cfm]: #cfcatch.message#">
        <cfset findscope = queryNew("")>
    </cfcatch>
</cftry>
