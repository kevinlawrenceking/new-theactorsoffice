<!--- This ColdFusion page updates the status of an audio role in the database based on the provided audrole ID. --->

<cfquery name="update">  
    <!--- Update the audroles table to set the specified status field to 0 for the given audrole ID. --->
    Update audroles
    set #statusfield# = 0
    where audroleid = #new_audroleid#
</cfquery>
