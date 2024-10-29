
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset variables.contactItemService.insertContactItem(contactid=g.contactid, work_phone=g.work_phone)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in g_insert_315_21.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
