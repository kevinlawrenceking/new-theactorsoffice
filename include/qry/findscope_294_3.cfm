
<cftry>
    <cfset findscope = createObject("component", "services.ContactItemService").SELcontactitems_24314(contactid=contactid, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findscope_294_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
