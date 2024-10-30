
<cftry>
    <cfset myteam = createObject("component", "services.ContactService").SELcontactdetails_24683(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in myteam_499_1.cfm]: #cfcatch.message#">
        <cfset myteam = queryNew("contactid,contactname,contactStatus", "integer,varchar,varchar")>
    </cfcatch>
</cftry>
