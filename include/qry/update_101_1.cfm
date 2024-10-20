
<cftry>
    <cfset componentPath = "/services/ContactService.cfc">
    <cfset functionName = "updatecontactdetails">
    <cfset contactService = createObject("component", componentPath)>
    <cfset result = contactService[functionName](idlist)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_101_1.cfm]: " & cfcatch.message>
        <!--- Log the error or handle it appropriately --->
    </cfcatch>
</cftry>
