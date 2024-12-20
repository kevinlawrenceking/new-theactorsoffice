<cfif application.dbug eq "Y" and userid eq 30>
    <!-- Insert debug information into the debugLog table -->
    <cfset debugService = createObject("component", "services.DebugService")>
    <cfset debugDetails = {
        arguments = arguments,
        queryResult = current_queryResult
    }>
    <cfset debugService.insertDebugLog(
        filename = cgi.script_name,
        debugDetails = serializeJSON(debugDetails)
    )>
</cfif>
