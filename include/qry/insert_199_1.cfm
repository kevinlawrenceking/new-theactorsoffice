<cfset itemTypesUserService = createObject("component", "services.ItemTypesUserService")>
<cfset itemTypesUserService.INSitemtypes_user(customtype=customtype, userid=userid)>