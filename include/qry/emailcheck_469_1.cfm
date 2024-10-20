
<cftry>
    <cfset emailcheck = createObject("component", "/services/ContactItemService").getcontactitems({
        valueCategory: "Email",
        contactID: currentid,
        itemstatus: "Active"
    })>
    <cfset emailcheck = arraySort(emailcheck, function(a, b) {
        return compare(b.primary_yn, a.primary_yn);
    })>
    <cfset emailcheck = arraySlice(emailcheck, 1, 1)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in emailcheck_469_1.cfm] #cfcatch.message#">
</cfcatch>
</cftry>
