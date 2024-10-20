
<cftry>
    <cfset variables.contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset variables.result = variables.contactItemService.updatecontactitems(itemid=itemidd, contactid=currentid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in del_159_10.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
