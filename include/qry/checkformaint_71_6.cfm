
<cftry>
    <cfset checkformaint = createObject("component", "services.SystemUserService").SELfusystemusers(contactid=contactid, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in checkformaint_71_6.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching data. Please try again later.">
    </cfcatch>
</cftry>
