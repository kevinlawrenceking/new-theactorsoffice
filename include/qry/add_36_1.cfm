
<cftry>
    <cfset variables.auditionLinkService = createObject("component", "services.AuditionLinkService")>
    <cfset variables.auditionLinkService.INSaudlinks(
        linkname = linkname,
        linkurl = linkurl,
        audroleid = audroleid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in add_36_1.cfm]: #cfcatch.message#" type="error">
        <cfthrow message="Error occurred while calling INSaudlinks function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>

