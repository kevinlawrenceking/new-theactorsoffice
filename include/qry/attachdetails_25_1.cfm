
<cftry>
    <cfset attachdetails = createObject("component", "services.AttachmentService").getAttachmentDetails(attachid=attachid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in attachdetails_25_1.cfm]: #cfcatch.message#">
        <cfset attachdetails = queryNew("attachid,noteid,attachname,attachfilename")>
    </cfcatch>
</cftry>
