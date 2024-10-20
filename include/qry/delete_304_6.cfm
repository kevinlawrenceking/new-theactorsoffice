
<cftry>
    <cfset resultqryUpdateCell = createObject("component", "/services/SystemUserService").updatefusystemusers(new_contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in delete_304_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
