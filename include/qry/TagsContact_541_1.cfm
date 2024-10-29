
<cftry>
    <cfset contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset TagsContact = contactItemService.getActiveContactTags(ContactID=#ContactID#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in TagsContact_541_1.cfm]: #cfcatch.message#">
        <cfset TagsContact = queryNew("valuetext, tag")>
    </cfcatch>
</cftry>
