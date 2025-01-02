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

<cffunction name="onRequest" returntype="void" output="true">
    <cfargument name="targetPage" required="true" type="string">

    <!--- Instantiate the AccessedService --->
    <cfset accessService = new services.AccessedService()>

    <!--- Extract path and filename from CGI.SCRIPT_NAME ---> 
    <cfset fullPath = CGI.SCRIPT_NAME>
    <cfset path = ListDeleteAt(fullPath, ListLen(fullPath, "/"), "/")>
    <cfset filename = ListLast(fullPath, "/")>

    <!--- Normalize path for web-relative path logging --->
    <cfset normalizedPath = Replace(path, "C:\home\theactorsoffice.com\wwwroot\new-subdomain", "", "all")>
    <cfset normalizedPath = Replace(normalizedPath, "\", "/", "all")> <!-- Replace backslashes with forward slashes -->

    <!-- Ensure normalizedPath always starts with a forward slash -->
    <cfif NOT Left(normalizedPath, 1) EQ "/">
        <cfset normalizedPath = "/" & normalizedPath>
    </cfif>

    <!--- Log the main requested file --->
    <cfset accessService.logFile(path=normalizedPath, filename=filename)>

    <!--- Read the content of the target page --->
    <cfset resolvedPath = ExpandPath(arguments.targetPage)>

    <!--- Check if the file exists before attempting to read ---> 
    <cfif FileExists(resolvedPath)>
        <!--- Read the content of the target page ---> 
        <cffile action="read" file="#resolvedPath#" variable="fileContent" />

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

                    <!-- Resolve full path using ExpandPath -->
                    <cfset includedPath = ExpandPath(includedFile)>

                    <!-- Extract the filename -->
                    <cfset includedFilename = ListLast(includedFile, "/")>

                    <!-- Normalize the directory path -->
                    <cfset includedDirectory = Replace(includedPath, "C:\home\theactorsoffice.com\wwwroot\new-subdomain", "", "all")>
                    <cfset includedDirectory = Replace(includedDirectory, "\", "/", "all")>
                    <cfif NOT Left(includedDirectory, 1) EQ "/">
                        <cfset includedDirectory = "/" & includedDirectory>
                    </cfif>

                    <!-- Log the included file -->
                    <cfset accessService.logFile(path=includedDirectory, filename=includedFilename)>
                </cfif>
            </cfif>

            <!-- Find the next occurrence of <cfinclude template= -->
            <cfset startPos = findNoCase(startToken, lcFileContent, endQuotePos + 1)>
        </cfloop>
    <cfelse>
        <!-- Handle missing file -->
        <cflog file="Application" text="File not found: #resolvedPath#" type="warn" />
    </cfif>

    <!--- Include the requested file ---> 
    <cfinclude template="#arguments.targetPage#">
</cffunction>


</cfcomponent>
