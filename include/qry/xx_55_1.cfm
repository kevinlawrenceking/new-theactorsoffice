
<cftry>
    <cfset xx = createObject("component", "services.ContactService").SELcontactdetails_23806(contactid=contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in xx_55_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
