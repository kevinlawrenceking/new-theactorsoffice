
<cftry>
    <cfset companies = createObject("component", "services.ContactItemService").SELcontactitems_24064(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in companies_203_3.cfm]: #cfcatch.message#">
        <cfset companies = queryNew("new_valuecompany", "varchar")>
    </cfcatch>
</cftry>
