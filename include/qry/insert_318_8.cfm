
<cftry>
    <cfset result = new services.SiteTypeUserService().insertsitetypes_user(
        siteTypeName = x.sitetypename,
        siteTypeDescription = x.sitetypedescription,
        userid = users.userid
    )>
    <!--- Update the database to set isfetch = 1 --->
    <cfquery>
        UPDATE your_table_name SET isfetch = 1 WHERE your_condition
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in insert_318_8.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
