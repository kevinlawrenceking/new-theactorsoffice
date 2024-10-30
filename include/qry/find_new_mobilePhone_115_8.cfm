
<cftry>
    <cfset find_new_mobilePhone = createObject("component", "services.ContactItemService").SELcontactitems_23894(new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_new_mobilePhone_115_8.cfm]: #cfcatch.message#">
        <cfthrow message="Error retrieving mobile phone data.">
    </cfcatch>
</cftry>
