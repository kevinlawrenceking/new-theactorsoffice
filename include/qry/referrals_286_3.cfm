
<cftry>
    <cfset referrals = createObject("component", "services.ContactService").SELcontactdetails_24263(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in referrals_286_3.cfm]: #cfcatch.message#">
        <cfset referrals = queryNew("contactid,recordname")>
    </cfcatch>
</cftry>
