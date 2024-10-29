
<cftry>
    <cfset x = createObject("component", "/services/ContactService").getActiveContacts(
        userId=session.userid,
        idList=idlist
    )>
    <cfcatch type="any">
        <cflog text="[Error in x_115_2.cfm]: #cfcatch.message#" type="error" file="errorLog">
    </cfcatch>
</cftry>
