
<cftry>
    <cfset castingdirectors_sel = createObject("component", "services.ContactItemService").SELcontactitems_24620(userid=#userid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in castingdirectors_sel_445_1.cfm]: #cfcatch.message#" />
        <cfthrow message="An error occurred while retrieving casting directors." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
