
<cftry>
    <cfset bigBrotherService = createObject("component", "services.BigBrotherService")>
    <cfset bigBrotherService.INSbigbrother(
        pgid = cookie.pgid,
        userid = session.userid,
        remote_addr = cgi.remote_addr,
        query_string = cgi.query_string,
        remote_host = cgi.remote_host,
        script_name_include = script_name_include,
        contactid = contactid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in bro_add_53_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
