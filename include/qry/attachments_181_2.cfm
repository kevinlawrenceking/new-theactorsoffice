
<cftry>
    <cfset attachments = createObject("component", "services.AttachmentService").SELattachments(new_noteid=new_noteid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in attachments_181_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
