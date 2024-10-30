
<cftry>
    <cfset FINDz = createObject("component", "services.ContactItemService").SELcontactitems_23948(deletecontactid=deletecontactid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FINDz_159_6.cfm]: #cfcatch.message#" type="error">
        <cfset FINDz = queryNew("itemid")>
    </cfcatch>
</cftry>
