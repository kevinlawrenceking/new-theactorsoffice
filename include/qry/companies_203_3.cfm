
<cftry>
    <cfset companies = createObject("component", "services.ContactItemService").getvm_contactitems_company(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in companies_203_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
