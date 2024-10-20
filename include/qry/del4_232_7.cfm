
<cftry>
    <cfset result = createObject("component", "/services/ContactAuditionService").deleteaudcontacts_auditions_xref(contactid=contactid, audprojectid=audprojectid)>
    <cfif result>
        <!--- Successfully deleted the record --->
    <cfelse>
        <!--- Handle failure case if needed --->
    </cfif>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in del4_232_7.cfm]: #cfcatch.message# Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
