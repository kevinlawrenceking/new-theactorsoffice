<cfcomponent extends="/app/Application">

    <cffunction name="onRequestStart" returntype="void" output="false">
        <cfargument name="targetPage" required="true" type="string">


        <cfset accessService = new services.AccessedService()>

 
        <cfset fullPath = CGI.SCRIPT_NAME>
        <cfset path = ListDeleteAt(fullPath, ListLen(fullPath, "/"), "/")>
        <cfset filename = ListLast(fullPath, "/")>

 
        <cfset accessService.logFile(path=path, filename=filename)>

        <cfscript>
         
            host = ListFirst(cgi.server_name, ".");

            if (host == "app" || host == "uat") {
                datasourceName = "abo";
                dsn = "abo";
            } else {
                datasourceName = "abod";
                dsn = "abod";
            }

 
            application.datasourceName = datasourceName;
            application.dsn = dsn;
        </cfscript>
    </cffunction>


</cfcomponent>
