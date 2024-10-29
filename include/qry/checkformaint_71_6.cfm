
<cftry>
    <cfset checkformaint = createObject("component", "/services/SystemUserService").getUserSystemID(contactid=contactid, userid=userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in checkformaint_71_6.cfm]: #cfcatch.message# Query: #cfcatch.detail#" />
        <cfthrow message="Database error occurred. Please try again later." />
    </cfcatch>
</cftry>
