<cfparam name="mediaid" default="">
<cfparam name="userid" default="#session.userid#">

<cfif len(mediaid)>
    <cfset AuditionMediaXRefService = createObject("component", "services.AuditionMediaXRefService")>
    <cfset AuditionMediaXRefService.INSaudmedia_auditions_xref_24153(mediaid=mediaid, audprojectid=audprojectid)>
    <cfoutput>{"status": "success", "message": "Headshot selected!"}</cfoutput>
<cfelse>
    <cfoutput>{"status": "error", "message": "No headshot selected."}</cfoutput>
</cfif>
