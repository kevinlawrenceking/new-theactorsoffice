
<cftry>
    <cfset companies = createObject("component", "services.ContactItemService").SELcontactitems_24040(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in companies_198_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
