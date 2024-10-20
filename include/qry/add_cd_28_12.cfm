
<cftry>
    <cfset result = createObject("component", "/services/ContactAuditionService").insertaudcontacts_auditions_xref(
        contactid = new_contactid,
        audprojectid = audprojectid,
        xrefNotes = "audition-add2.cfm"
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 if needed --->
<cfcatch>
    <cflog text="[Error in add_cd_28_12.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
