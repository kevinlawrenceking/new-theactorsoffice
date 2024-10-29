
<cftry>
    <cfset findscope = createObject("component", "services.ContactItemService").getActiveContactTags(contactid=contactid, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findscope_294_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
