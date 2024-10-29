
<cftry>
    <cfset findscope = createObject("component", "/services/ContactItemService").getActiveContactTags(contactid=#contactid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findscope_539_2.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
