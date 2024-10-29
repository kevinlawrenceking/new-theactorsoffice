
<cftry>
    <cfset eventContactsService = new "/services/EventContactsXRefService.cfc"()>
    <cfset eventContactsService.insertEventContact(new_eventid=new_eventid, new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in inserts_14_7.cfm]: #cfcatch.message#"/>
        <cfrethrow/>
    </cfcatch>
</cftry>
