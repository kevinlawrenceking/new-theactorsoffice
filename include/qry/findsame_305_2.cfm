
<cftry>
    <cfset contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset findsame = contactItemService.getActiveContactItemsByTag(new_contactid=new_contactid, new_tagname=new_tagname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findsame_305_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
