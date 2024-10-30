
<cftry>
    <cfset mylinks = createObject("component", "services.ContactItemService").SELcontactitems_24682(userContactID=#userContactID#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mylinks_498_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
