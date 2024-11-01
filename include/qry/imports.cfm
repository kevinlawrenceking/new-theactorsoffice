<cfif not structKeyExists(variables, "ContactImportService")>
    <cfset ContactImportService = createObject("component", "path.to.ContactImportService")>
</cfif>
