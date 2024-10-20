
<cftry>
    <cfset result = createObject("component", "services.ContactAuditionService").deleteaudcontacts_auditions_xref(contactid=old_contactid, audprojectid=audprojectid)>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in del_277_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
