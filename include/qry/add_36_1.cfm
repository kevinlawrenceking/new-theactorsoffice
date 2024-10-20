
<cftry>
    <cfset result = createObject("component", "services.AuditionLinkService").insertaudlinks(
        linkname = linkname,
        linkurl = linkurl,
        userid = session.userid,
        audroleid = audroleid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in add_36_1.cfm]: #cfcatch.message# Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
