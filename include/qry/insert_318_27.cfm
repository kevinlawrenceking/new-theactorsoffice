
<cftry>
    <cfset result = new services.TagsUserService().inserttags_user(
        tagname = x.tagname,
        userid = users.userid,
        tagtype = x.tagtype
    )>
    <!--- Update the database to set isfetch = 1 --->
    <cfquery>
        UPDATE some_table SET isfetch = 1 WHERE some_condition
    </cfquery>
<cfcatch type="any">
    <cfset errorLog("[Error in insert_318_27.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
