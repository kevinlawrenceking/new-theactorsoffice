<cfset eventTypesUserService = createObject("component", "services.EventTypesUserService")>
<cfset eventTypesUserService.UPDeventtypes_user(
    id = id,
    new_eventtypecolor = new_eventtypecolor,
    deletelink = deletelink,
    new_iscustom = new_iscustom,
    new_eventtypename = new_eventtypename
)>
<cfoutput>

  id = #id#,<BR>
    new_eventtypecolor = #new_eventtypecolor#<BR>
    deletelink = #deletelink#,<BR>
    new_iscustom = #new_iscustom#,<BR>
    new_eventtypename = #new_eventtypename#<BR>

    </cfoutput>