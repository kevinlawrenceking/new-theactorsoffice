<cfset auditionTypeService = createObject("component", "services.AuditionTypeService")>
<cfset auditionTypeService.INSaudtypes(
    new_audtype=new_audtype,
    new_audCatid=new_audCatid,
    new_isDeleted=new_isDeleted
)>