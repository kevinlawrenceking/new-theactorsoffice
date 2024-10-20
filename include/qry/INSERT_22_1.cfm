
<cftry>
    <cfset result = createObject("component", "/services/AttachmentService").insertattachments(
        attachname = attachname,
        attachfilename = attachfilename,
        isdeleted = 0,
        userid = session.userid,
        noteid = noteid
    )>
    <cfset isfetch = 1>
    <!--- Update database to set isfetch = 1 --->
    <cfquery>
        UPDATE your_table_name SET isfetch = 1 WHERE your_condition
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in INSERT_22_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
