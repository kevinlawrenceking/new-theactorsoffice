
<cftry>
    <cfset linkdetails = createObject("component", "services.EventTypesUserService").DETeventtypes_user(id=id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in linkdetails_309_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
