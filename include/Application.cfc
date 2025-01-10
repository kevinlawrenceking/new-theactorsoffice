<cfcomponent extends="/app/Application">
    <!-- This Application.cfc acts as a proxy to the main Application.cfc in /app -->

  <cffunction name="onRequestStart" returntype="void" output="false">
        <cfscript>
            // Get the first part of the server name (subdomain)
            host = ListFirst(cgi.server_name, ".");

            // Determine the datasource based on the host
            if (host == "app" || host == "uat") {
                datasourceName = "abo";
                dsn = "abo";
            } else {
                datasourceName = "abod";
                dsn = "abod";
            }

            // Optionally store the datasource in application or request scope
            application.datasourceName = datasourceName;
            application.dsn = dsn;
        </cfscript>
    </cffunction>
    <cfquery name="getUserPreferences">
        SELECT 
            u.dateformatid, 
            d.formatExample
        FROM 
            taouser u
        LEFT JOIN 
            dateformats d ON u.dateformatid = d.id
        WHERE 
            u.userid = <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif getUserPreferences.recordcount>
        <cfset session.user = {
            dateformatid = getUserPreferences.dateformatid,
            dateformatExample = getUserPreferences.formatExample
        }>
    <cfelse>
        <!-- Fallback to default -->
        <cfset session.user = {
            dateformatid = 1,
            dateformatExample = "mm/dd/yyyy"
        }>
    </cfif>

 
    <cfset session.formatDate = function(dateToFormat) {
        var format = StructKeyExists(session.user, "dateformatExample") ? session.user.dateformatExample : "mm/dd/yyyy";
        return DateFormat(dateToFormat, format);
    }>
</cffunction>
    </cfcomponent>