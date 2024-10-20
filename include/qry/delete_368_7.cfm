
<cftry>
    <cfset result = createObject("component", "/services/ContactAuditionService").deleteaudcontacts_auditions_xref(
        contactid = deletecontactid,
        audprojectid = audprojectid
    )>
    <cfif result>
        <!--- Successfully deleted record --->
    <cfelse>
        <!--- Handle unsuccessful deletion if necessary --->
    </cfif>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in delete_368_7.cfm] #cfcatch.message# Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
