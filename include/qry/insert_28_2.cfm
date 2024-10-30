
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset variables.contactItemService.INScontactitems(new_contactid=new_contactid, cdtype=cdtype)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_28_2.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INScontactitems.">
    </cfcatch>
</cftry>
