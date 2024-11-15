<!--- This ColdFusion page handles the insertion of audition contact references into the database. --->

<cfquery name="add_cd">
    <!--- Insert a new record into the audition contacts cross-reference table. --->
    INSERT IGNORE INTO `audcontacts_auditions_xref`
    SET `audprojectid` = #audprojectid#,
        xrefNotes = 'audition-add2.cfm',
        `contactid` = #new_contactid#;
</cfquery>
