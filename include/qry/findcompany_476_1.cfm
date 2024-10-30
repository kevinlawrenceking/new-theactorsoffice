
<cftry>
    <cfset findcompany = createObject("component", "services.ContactItemService").SELcontactitems_24663(currentid=#currentid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findcompany_476_1.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
