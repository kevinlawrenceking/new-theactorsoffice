
<cftry>
    <cfset FindModalTitle = createObject("component", "services.PageService").getPgPagesWithCompName(rpgid=rpgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindModalTitle_107_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
