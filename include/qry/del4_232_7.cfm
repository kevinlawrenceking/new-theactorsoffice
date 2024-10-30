
<cftry>
    <cfset variables.contactAuditionService = createObject("component", "/services/ContactAuditionService")>
    <cfset variables.contactAuditionService.DELaudcontacts_auditions_xref_24127(audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del4_232_7.cfm]: #cfcatch.message#">
        <cflog file="errorLog" text="Function: DELaudcontacts_auditions_xref_24127 with audprojectid = #audprojectid#">
        <cflog file="errorLog" text="Error Detail: #cfcatch.detail#">
    </cfcatch>
</cftry>
