
<!--- This ColdFusion page inserts event contact references into the eventcontactsxref table. --->
<cftry>
    <cfset objEventContactsXRefService = createObject("component", "/services/EventContactsXRefService")>
    <cfset objEventContactsXRefService.INSeventcontactsxref_24061(eventNumber=eventNumber, contactID=CONTACTID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in inserts_202_9.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
