
<cftry>
    <cfset queryFullNames = createObject("component", "/services/ContactService").getvm_contactdetails_audcontacts(arguments.searchTerm)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in queryFullNames_129_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
