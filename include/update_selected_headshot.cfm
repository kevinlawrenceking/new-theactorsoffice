<cfparam name="mediaid" default="">
<cfparam name="audprojectid" default="">
<cfparam name="userid" default="#session.userid#">

<cfif len(mediaid) AND len(audprojectid)>
    <cfset AuditionMediaXRefService = createObject("component", "services.AuditionMediaXRefService")>
    <cfset AuditionMediaXRefService.INSaudmedia_auditions_xref_24153(mediaid=mediaid, audprojectid=audprojectid)>
    <cfoutput>{"status": "success", "message": "mediaid: #mediaid# - audprojectid: #audprojectid#-Headshot selected!"}</cfoutput>
<cfelse>
    <cfoutput>{"status": "error", "message": "Missing media or project ID."}</cfoutput>
</cfif>
