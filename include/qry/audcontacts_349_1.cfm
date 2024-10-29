
<cftry>
    <cfset audcontacts = createObject("component", "services.ContactService").getContactDetailsByAudProjectID(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in audcontacts_349_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
