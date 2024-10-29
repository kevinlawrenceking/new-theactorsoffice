
<cftry>
    <cfset variables.contactItemService = createObject("component", "services.ContactItemService")>
    <cfset variables.contactItemService.insertContactItem(new_contactid=new_contactid, new_tagname=new_tagname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_305_3.cfm]: #cfcatch.message#">
        <cfthrow message="Error in insert_305_3.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
