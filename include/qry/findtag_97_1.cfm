
<cftry>
    <cfset findtag = createObject("component", "services.ContactItemService").SELcontactitems_23855(contactid=myteam.contactid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findtag_97_1.cfm]: #cfcatch.message#" />
        <cfthrow />
    </cfcatch>
</cftry>
