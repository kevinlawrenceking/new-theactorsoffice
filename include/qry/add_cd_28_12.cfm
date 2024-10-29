
<!--- This ColdFusion page handles the insertion of audition contact references into the database. --->
<cftry>
    <cfset variables.contactAuditionService = createObject("component", "/services/ContactAuditionService.cfc")>
    <cfset variables.contactAuditionService.insertAuditionContact(audprojectid=audprojectid, new_contactid=new_contactid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in add_cd_28_12.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling insertAuditionContact." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
