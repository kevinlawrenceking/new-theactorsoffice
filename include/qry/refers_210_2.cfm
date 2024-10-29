
<cftry>
    <cfset refers = createObject("component", "/services/ContactService").getContactDetails(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in refers_210_2.cfm] #cfcatch.message#">
        <cfset refers = queryNew("")>
    </cfcatch>
</cftry>
