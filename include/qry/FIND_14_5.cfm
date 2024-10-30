
<cftry>
    <cfset FIND = createObject("component", "services.ContactService").SELcontactdetails_23727(userid=userid, relationship=relationship)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FIND_14_5.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving contact details.">
    </cfcatch>
</cftry>
