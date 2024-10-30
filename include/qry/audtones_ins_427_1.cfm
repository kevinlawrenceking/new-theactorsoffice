
<cftry>
    <cfset variables.auditionTonesService = createObject("component", "/services/AuditionTonesService.cfc")>
    <cfset variables.auditionTonesService.UPDaudtones(
        new_tone=new_tone,
        new_audCatid=new_audCatid,
        new_isDeleted=new_isDeleted,
        new_toneid=new_toneid
    )>
    <cfquery datasource="yourDatasourceName">
        UPDATE audtones 
        SET isfetch = 1
        WHERE toneid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_toneid#">
    </cfquery>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audtones_ins_427_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
