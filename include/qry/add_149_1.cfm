
<cftry>
    <cfset variables.linkService = createObject("component", "services.LinkService")>
    <cfset variables.linkService.INSlinks(
        linkname = linkname,
        linkurl = linkurl,
        noteid = noteid
    )>
    <!--- Update the database to set isfetch = 1 --->
    <cfquery datasource="yourDataSource">
        UPDATE some_table SET isfetch = 1 WHERE some_condition
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in add_149_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
