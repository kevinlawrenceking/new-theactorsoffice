
<cftry>
    <cfset contactService = createObject("component", "services.ContactService")>
    <cfset find = contactService.getContactDetails(fname=x.fname, lname=x.lname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_315_4.cfm]: #cfcatch.message#">
        <cfset find = queryNew("")>
    </cfcatch>
</cftry>
