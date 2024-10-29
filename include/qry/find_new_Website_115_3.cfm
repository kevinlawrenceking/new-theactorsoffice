
<cftry>
    <cfset find_new_Website = createObject("component", "services.ContactItemService").getNewWebsite(new_contactid=new_contactid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_new_Website_115_3.cfm]: #cfcatch.message#" />
        <cfthrow message="An error occurred while fetching the new website." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
