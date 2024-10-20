
<cftry>
    <cfset eventTypesUserService = new "/services/EventTypesUserService.cfc"()>
    <cfset eventTypesUserService.inserteventtypes_user(
        eventTypeName = xs.eventTypeName,
        eventtypedescription = xs.eventtypedescription,
        eventtypecolor = xs.eventtypecolor,
        userid = users.userid
    )>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assume there is a method or query to update this status --->
<cfcatch type="any">
    <cfset errorLog = "[Error in insert_318_21.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
