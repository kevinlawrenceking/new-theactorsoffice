
<cftry>
    <cfset Findchild = createObject("component", "services.PageService").SELpgpages_23868(pgid=pgid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in Findchild_107_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while fetching child page data.">
    </cfcatch>
</cftry>
