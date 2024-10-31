
<cftry>
    <cfset contactItemService = createObject("component", "services.ContactItemService")>
    <cfset contactItemService.INScontactitems_24404(contactid=tag.contactid, new_tag1=new_tag1)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tag_insert_315_11.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
