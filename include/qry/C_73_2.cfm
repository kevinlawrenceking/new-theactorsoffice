
<cftry>
    <cfset C = createObject("component", "services.ContactService").SELcontactdetails_23843(userid=u.userid, select_contactid=select_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in C_73_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
