
<!--- This ColdFusion page handles the insertion of audition contacts into the database. --->

<cftry>
    <cfset contactAuditionService = createObject("component", "/services/ContactAuditionService")>
    <cfset contactAuditionService.insertAudContactAuditionXref(
        audprojectid = cdcheck.audprojectid,
        contactid = cdcheck.contactid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_cd_368_10.cfm]: #cfcatch.message#">
        <cfthrow message="Database operation failed." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
