
<cftry>
    <cfset variables.bigBrotherService = new "/services/BigBrotherService.cfc"()>
    <cfset variables.result = variables.bigBrotherService.insertbigbrother(
        pgid = cookie.pgid,
        userid = session.userid,
        remote_addr = cgi.remote_addr,
        query_string = cgi.query_string,
        remote_host = cgi.remote_host,
        script_name = script_name_include,
        contactid = contactid,
        isInclude = "Y"
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in bro_add_53_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
