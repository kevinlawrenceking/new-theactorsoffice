
<cftry>
    <cfset variables.eventContactsService = createObject("component", "services.EventContactsXRefService")>
    <cfset variables.eventContactsService.INSeventcontactsxref(new_eventid=new_eventid, new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in inserts_14_7.cfm]: #cfcatch.message#"/>
        <cfrethrow/>
    </cfcatch>
</cftry>
