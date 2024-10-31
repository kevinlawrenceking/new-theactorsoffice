
<cftry>
    <cfset eventContactsService = createObject("component", "services.EventContactsXRefService")>
    <cfset eventContactsService.INSeventcontactsxref_23737(eventid=eventid, new_contactid=new_contactid)>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in inserts_18_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
