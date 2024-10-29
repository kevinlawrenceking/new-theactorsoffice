
<cftry>
    <cfset result = createObject("component", "services.ContactService").INScontactdetails_23769(userid=userid, cdfullname=cdfullname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_28_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
