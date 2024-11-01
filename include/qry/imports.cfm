<cfif not structKeyExists(variables, "ContactImportService")>
    <cfset ContactImportService = createObject("component", "services.ContactImportService")>
</cfif>
