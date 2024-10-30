
<cftry>
    <cfset audcontacts_sel = createObject("component", "/services/ContactService").SELcontactdetails_24515(userid=userid, audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcontacts_sel_349_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving contacts." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
