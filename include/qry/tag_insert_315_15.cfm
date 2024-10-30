
<cftry>
    <cfset variables.contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset variables.contactItemService.INScontactitems_24408(contactid=tag.contactid, new_tag3=new_tag3)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tag_insert_315_15.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the contact item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
