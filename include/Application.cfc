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

        <!--- Convert file content to lowercase for case-insensitive search ---> 
        <cfset lcFileContent = lcase(fileContent)>

        <!--- Search for <cfinclude template= ---> 
        <cfset startToken = "<cfinclude template=">
        <cfset startPos = findNoCase(startToken, lcFileContent)>

        <!--- Process all occurrences of cfinclude ---> 
        <cfloop condition="startPos NEQ 0">
            <!-- Move past the start token -->
            <cfset offset = startPos + len(startToken)>

            <!-- Find the opening quote (' or ") -->
            <cfset firstQuotePos = findNoCase("'", lcFileContent, offset)>
            <cfif firstQuotePos EQ 0>
                <cfset firstQuotePos = findNoCase('"', lcFileContent, offset)>
            </cfif>

            <!-- If an opening quote is found, locate the closing quote -->
            <cfif firstQuotePos NEQ 0>
                <cfset quoteChar = mid(fileContent, firstQuotePos, 1)>
                <cfset endQuotePos = find(quoteChar, fileContent, firstQuotePos + 1)>
                <cfif endQuotePos NEQ 0>
                    <!-- Extract the included file path -->
                    <cfset includedFile = mid(fileContent, firstQuotePos + 1, endQuotePos - (firstQuotePos + 1))>
                    <cfset includedPath = ExpandPath(includedFile)>
                    <cfset includedFilename = ListLast(includedPath, "/")>
                    <cfset includedDirectory = ListDeleteAt(includedPath, ListLen(includedPath, "/"), "/")>

                    <!-- Log the included file -->
                    <cfset accessService.logFile(path=includedDirectory, filename=includedFilename)>
                </cfif>
            </cfif>

            <!-- Find the next occurrence of <cfinclude template= -->
            <cfset startPos = findNoCase(startToken, lcFileContent, endQuotePos + 1)>
        </cfloop>

        <!--- Include the requested file ---> 
        <cfinclude template="#arguments.targetPage#">
    </cffunction>

</cfcomponent>
