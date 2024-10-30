
<cftry>
    <cfset pageService = createObject("component", "services.PageService")>
    <cfset RPG = pageService.SELpgpages_24300(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in RPG_288_1.cfm]: #cfcatch.message# - #cfcatch.detail#">
        <cfthrow message="Error in RPG_288_1.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
