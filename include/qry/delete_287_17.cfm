<!--- This ColdFusion page handles the deletion of records from the audageranges_audtion_xref table based on the provided audroleid. --->

<cfquery name="delete">
    <!--- Execute a delete query to remove records from audageranges_audtion_xref where the audroleid matches the provided new_audroleid. --->
    delete from audageranges_audtion_xref 
    where audroleid = #new_audroleid#
</cfquery>
