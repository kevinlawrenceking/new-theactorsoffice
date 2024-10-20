
<cftry>
    <cfset result = createObject("component", "services.AuditionContractTypeService").updateaudcontracttypes(
        contracttypeid=new_contracttypeid,
        contracttype=new_contracttype,
        audCatid=new_audCatid,
        isDeleted=new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcontracttypes_ins_354_1.cfm] #cfcatch.message# Details: #cfcatch.detail#">
    </cfcatch>
</cftry>
