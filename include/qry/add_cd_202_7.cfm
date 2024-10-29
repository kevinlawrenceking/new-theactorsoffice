
<!--- This ColdFusion page handles the insertion of audition contact records into the database. --->

<cftry>
    <cfset contactAuditionService = new "/services/ContactAuditionService.cfc"()>
    <cfset contactAuditionService.insertAuditionContact(audprojectid=#audprojectid#, contactid=#CONTACTID#)>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in add_cd_202_7.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
