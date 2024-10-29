
<cftry>
    <cfset contactService = createObject("component", "/services/ContactService")>
    <cfset C = contactService.getContactDetails(userid=u.userid, select_contactid=select_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in C_73_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
