
<cftry>
    <cfset FindActive = createObject("component", "services.SystemUserService").SELfusystemusers_24343(contactID=new_contactid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindActive_304_4.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
