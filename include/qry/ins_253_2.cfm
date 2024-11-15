<!--- This ColdFusion page inserts a record into the audmedia_auditions_xref table with specified mediaid and audprojectid. --->

<cfquery name="ins">
    <!--- Insert a new record into the audmedia_auditions_xref table --->
    insert into audmedia_auditions_xref (mediaid, audprojectid) 
    values (#mediaid#, #audprojectid#)
</cfquery>
