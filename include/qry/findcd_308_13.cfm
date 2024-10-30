
<cftry>
    <cfset findcd = createObject("component", "/services/ContactService").SELcontactdetails_24364(cdfullname=cdfullname, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findcd_308_13.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
