<cfcomponent extends="/app/Application">


  <cffunction name="onRequestStart" returntype="void" output="false">
  <cfargument name="targetPage" required="true" type="string">

    <!--- Instantiate the AccessedService --->
    <cfset accessService = new services.AccessedService()>

    <!--- Extract path and filename from CGI.SCRIPT_NAME --->
    <cfset fullPath = CGI.SCRIPT_NAME>
    <cfset path = ListDeleteAt(fullPath, ListLen(fullPath, "/"), "/")>
    <cfset filename = ListLast(fullPath, "/")>

    <!--- Log the accessed file --->
    <cfset accessService.logFile(path=path, filename=filename)>


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

    </cfcomponent>