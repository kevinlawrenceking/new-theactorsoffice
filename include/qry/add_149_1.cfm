
<cftry>
    <cfset variables.linkService = createObject("component", "services.LinkService")>
    <cfset variables.linkService.insertLink(
        linkname = linkname,
        linkurl = linkurl,
        noteid = noteid
    )>
    <cfquery name="updateFetchStatus" datasource="yourDataSource">
        UPDATE yourTableName
        SET isfetch = 1
        WHERE someCondition = someValue
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in add_149_1.cfm] #cfcatch.message#">
</cfcatch>
</cftry>
