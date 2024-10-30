
<cftry>
    <cfset refers = createObject("component", "services.ContactService").SELcontactdetails_24069(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in refers_210_2.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
