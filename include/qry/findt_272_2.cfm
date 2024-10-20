
<cftry>
    <cfset findt = createObject("component", "/services/ContactItemService").getcontactitems({
        valueCategory: "Tag",
        itemstatus: "Active",
        contactID: ContactID,
        valuetext: new_tagname
    })>
    <cfcatch>
        <cfset errorLog = "[Error in findt_272_2.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
