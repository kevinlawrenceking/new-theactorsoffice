
<cftry>
    <cfset contactService = createObject("component", "/services/ContactService")>
    <cfset contactService.INScontactdetails_24399(x=x)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_315_6.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
