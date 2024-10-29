
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset variables.contactItemService.insertContactItem(contactid=tag.contactid, new_tag2=new_tag2)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in tag_insert_315_13.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
