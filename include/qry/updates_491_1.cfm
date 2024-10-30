
<cftry>
    <cfset updates = createObject("component", "/services/ContactService").SELcontactdetails_24674(userId=1, compId=1)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updates_491_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
