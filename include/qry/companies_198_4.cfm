
<cftry>
    <cfset companies = createObject("component", "services.ContactItemService").getvm_contactitems_company(userid)>
<cfcatch>
    <cfset errorLog = "[Error in companies_198_4.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
