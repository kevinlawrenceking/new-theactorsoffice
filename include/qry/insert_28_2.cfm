
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc" />
    <cfset contactItemService.insertContactItem(new_contactid=new_contactid, cdtype=cdtype) />
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_28_2.cfm]: #cfcatch.message#" />
        <cfthrow message="Error occurred while calling insertContactItem function." />
    </cfcatch>
</cftry>
