<cfparam name="mediaid" default="">
<cfparam name="audprojectid" default="">
<cfparam name="userid" default="#session.userid#">

<!-- Debugging Output -->
<cflog file="debug_audition" text="Received mediaid=#mediaid#, audprojectid=#audprojectid#" />

<cfif len(mediaid) AND len(audprojectid)>
    <cfset AuditionMediaXRefService = createObject("component", "services.AuditionMediaXRefService")>
    
    <!-- Debugging before calling the function -->
    <cflog file="debug_audition" text="Calling INSaudmedia_auditions_xref_24153 with mediaid=#mediaid# and audprojectid=#audprojectid#" />
    
    <cfset AuditionMediaXRefService.INSaudmedia_auditions_xref_24153(mediaid=mediaid, audprojectid=audprojectid)>

    <!-- Confirm update execution -->
    <cfoutput>{"status": "success", "message": "mediaid: #mediaid# - audprojectid: #audprojectid# - Headshot selected!"}</cfoutput>
<cfelse>
    <cfoutput>{"status": "error", "message": "Missing media or project ID. mediaid=#mediaid#, audprojectid=#audprojectid#."}</cfoutput>
</cfif>
