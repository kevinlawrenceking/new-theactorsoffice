
<cftry>
    <cfset FindRefcontacts = createObject("component", "services.ContactService").getcontactdetails(contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindRefcontacts_135_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
