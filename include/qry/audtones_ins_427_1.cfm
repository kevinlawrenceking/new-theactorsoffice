<cfset auditionTonesService = createObject("component", "services.AuditionTonesService.cfc")>
<cfset auditionTonesService.UPDaudtones(
    new_tone=new_tone,
    new_audCatid=new_audCatid,
    new_isDeleted=new_isDeleted,
    new_toneid=new_toneid
)>
<cfquery result="result" datasource="abodName">
    UPDATE audtones 
    SET isfetch = 1
    WHERE toneid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_toneid#">
</cfquery>