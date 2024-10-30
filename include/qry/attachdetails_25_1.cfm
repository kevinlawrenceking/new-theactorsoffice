
<cftry>
    <cfset attachdetails = createObject("component", "services.AttachmentService").DETattachments(attachid=attachid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in attachdetails_25_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
