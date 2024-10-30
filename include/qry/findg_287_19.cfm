
<cftry>
    <cfset findg = createObject("component", "services.ContactService").SELcontactdetails_24293(userid=userid, referral=referral)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in findg_287_19.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
