
<cfscript>
try {
    // Create an instance of the ContactService component
    contactService = new "/services/ContactService.cfc";

    // Call the function to get the contact record name
    fin_recordname = contactService.getContactRecordName(new_contactid);
} catch (any e) {
    // Log the error details
    cflog(
        file="errorLog",
        text="[Error in fin_recordname_157_1.cfm]: #e.message#"
    );
}
</cfscript>
