
<cftry>
    <cfset pageService = new "/services/PageService.cfc"()>
    <cfset RPG = pageService.getPgPagesData(rpgid=#rpgid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in RPG_288_1.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
