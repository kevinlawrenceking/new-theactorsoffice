
<cftry>
    <cfset queryFullNames = createObject("component", "/services/ContactService").getContactFullnames(arguments.searchTerm) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in queryFullNames_129_1.cfm]: #cfcatch.message#" />
        <cfthrow message="An error occurred while retrieving contact fullnames." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
