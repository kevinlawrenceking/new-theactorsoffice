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

    <cfset accessService = new services.AccessedService()>

    <cfset fullPath = CGI.SCRIPT_NAME>
    <cfset path = ListDeleteAt(fullPath, ListLen(fullPath, "/"), "/")>
    <cfset filename = ListLast(fullPath, "/")>

    <cfset normalizedPath = Replace(path, "C:\home\theactorsoffice.com\wwwroot\new-subdomain", "", "all")>
    <cfset normalizedPath = Replace(normalizedPath, "\", "/", "all")>
    <cfif NOT Left(normalizedPath, 1) EQ "/">
        <cfset normalizedPath = "/" & normalizedPath>
    </cfif>

    <cfset accessService.logFile(path=normalizedPath, filename=filename)>

    <cfset resolvedPath = ExpandPath(arguments.targetPage)>

    <cfif FileExists(resolvedPath)>
        <cffile action="read" file="#resolvedPath#" variable="fileContent" />
        <cfset lcFileContent = lcase(fileContent)>
        <cfset startToken = "<cfinclude template=">
        <cfset startPos = findNoCase(startToken, lcFileContent)>

        <cfloop condition="startPos NEQ 0">
            <cfset offset = startPos + len(startToken)>
            <cfset firstQuotePos = findNoCase("'", lcFileContent, offset)>
            <cfif firstQuotePos EQ 0>
                <cfset firstQuotePos = findNoCase('"', lcFileContent, offset)>
            </cfif>
            <cfif firstQuotePos NEQ 0>
                <cfset quoteChar = mid(fileContent, firstQuotePos, 1)>
                <cfset endQuotePos = find(quoteChar, fileContent, firstQuotePos + 1)>
                <cfif endQuotePos NEQ 0>
                    <cfset includedFile = mid(fileContent, firstQuotePos + 1, endQuotePos - (firstQuotePos + 1))>
                    <cfset includedPath = ExpandPath(includedFile)>
                    <cfset includedFilename = ListLast(includedFile, "/")>
                    <cfset includedDirectory = Replace(includedPath, "C:\home\theactorsoffice.com\wwwroot\new-subdomain", "", "all")>
                    <cfset includedDirectory = Replace(includedDirectory, "\", "/", "all")>
                    <cfif NOT Left(includedDirectory, 1) EQ "/">
                        <cfset includedDirectory = "/" & includedDirectory>
                    </cfif>
                    <cfset includedDirectory = Replace(includedDirectory, "/" & includedFilename, "", "one")>
                    <cfset accessService.logFile(path=includedDirectory, filename=includedFilename)>
                </cfif>
            </cfif>
            <cfset startPos = findNoCase(startToken, lcFileContent, endQuotePos + 1)>
        </cfloop>
    <cfelse>
        <cflog file="Application" text="File not found: #resolvedPath#" type="warn" />
    </cfif>

    <cfinclude template="#arguments.targetPage#">
</cffunction>



</cfcomponent>
