
<cftry>
    <cfset findscope_old = createObject("component", "services.ContactItemService").SELcontactitems_24313(contactid=contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findscope_old_294_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
