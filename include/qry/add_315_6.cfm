
<cftry>
    <cfset variables.contactService = createObject("component", "/services/ContactService")>
    <cfset variables.contactService.INScontactdetails_24399(x=x)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_315_6.cfm] #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
