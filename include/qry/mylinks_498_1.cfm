
<cftry>
    <cfset mylinks = createObject("component", "/services/ContactItemService").getContactItems(userContactID=#userContactID#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mylinks_498_1.cfm]: #cfcatch.message#">
        <cfset mylinks = queryNew("valuetext, valuetype, typeIcon, valuecategory")>
    </cfcatch>
</cftry>
