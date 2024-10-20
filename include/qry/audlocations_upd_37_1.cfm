
<cftry>
    <cfset result = createObject("component", "/services/AuditionLocationService").updateaudlocations(
        new_userid = new_userid,
        new_eventLocation = new_eventLocation,
        new_audlocadd1 = new_audlocadd1,
        new_audlocadd2 = new_audlocadd2,
        new_audcity = new_audcity,
        new_region_id = new_region_id,
        new_audzip = new_audzip,
        new_isDeleted = new_isDeleted,
        new_audlocid = new_audlocid
    )>
    <cfcatch type="any">
        <cfset errorLog("[Error in audlocations_upd_37_1.cfm]: " & cfcatch.message)>
    </cfcatch>
</cftry>
