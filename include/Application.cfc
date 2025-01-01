<cfcomponent extends="/app/Application">

    <cffunction name="onRequestStart" returntype="void" output="false">
        <cfargument name="targetPage" required="true" type="string">

        <!--- Instantiate the AccessedService --->
        <cfset accessService = new services.AccessedService()>

        <!--- Extract path and filename from CGI.SCRIPT_NAME --->
        <cfset fullPath = CGI.SCRIPT_NAME>
        <cfset path = ListDeleteAt(fullPath, ListLen(fullPath, "/"), "/")>
        <cfset filename = ListLast(fullPath, "/")>

        <!--- Log the accessed file (main request) --->
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

    <cffunction name="onRequest" returntype="void" output="true">
        <cfargument name="targetPage" required="true" type="string">

        <!--- Instantiate the AccessedService --->
        <cfset accessService = new services.AccessedService()>

        <!--- Extract path and filename from CGI.SCRIPT_NAME --->
        <cfset fullPath = CGI.SCRIPT_NAME>
        <cfset path = ListDeleteAt(fullPath, ListLen(fullPath, "/"), "/")>
        <cfset filename = ListLast(fullPath, "/")>

        <!--- Log the main requested file --->
        <cfset accessService.logFile(path=path, filename=filename)>

        <!--- Read the content of the target page --->
        <cffile action="read" file="#ExpandPath(arguments.targetPage)#" variable="fileContent">

        <!--- Scan for cfinclude tags in the content --->
        <cfset pattern = "<cfinclude\s+template\s*=\s*['\"]([^'\"]+)['\"]" />

        <cfset matches = REFindNoCase(pattern, fileContent, 1, true)>

        <!--- Loop through the matches and log each included file --->
        <cfif ArrayLen(matches.pos[1])>
            <cfloop index="i" from="1" to="#ArrayLen(matches.pos[1])#">
                <!--- Extract the included file path --->
                <cfset includedFile = Mid(fileContent, matches.pos[1][i], matches.len[1][i])>
                <cfset includedFile = ReReplaceNoCase(includedFile, "<cfinclude\s+template\s*=\s*[\"']([^\"']+)[\"'].*", "\1", "all")>

                <!--- Resolve full path and split into directory and filename --->
                <cfset includedPath = ExpandPath(includedFile)>
                <cfset includedFilename = ListLast(includedPath, "/")>
                <cfset includedDirectory = ListDeleteAt(includedPath, ListLen(includedPath, "/"), "/")>

                <!--- Log the included file --->
                <cfset accessService.logFile(path=includedDirectory, filename=includedFilename)>
            </cfloop>
        </cfif>

        <!--- Include the requested file --->
        <cfinclude template="#arguments.targetPage#">
    </cffunction>

</cfcomponent>
