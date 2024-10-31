
<cftry>
    <cfset fin_recordname = createObject("component", "services.ContactService").SELcontactdetails_23932(new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in fin_recordname_157_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
