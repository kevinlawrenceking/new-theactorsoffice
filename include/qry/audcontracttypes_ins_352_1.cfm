
<cftry>
    <cfset result = createObject("component", "services.AuditionContractTypeService").insertaudcontracttypes(
        contracttypeid = 0, 
        contracttype = new_contracttype, 
        audCatid = new_audCatid, 
        isDeleted = new_isDeleted, 
        recordname = ""
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audcontracttypes_ins_352_1.cfm]: #cfcatch.message# Details: #cfcatch.detail#">
    </cfcatch>
</cftry>

