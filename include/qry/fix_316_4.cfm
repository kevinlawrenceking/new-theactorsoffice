<!--- This ColdFusion page updates the project date in the audprojects table based on the corresponding date in the auditionsimport table. --->

<cfquery name="fix">
    <!--- Update the audprojects table with the projdate from auditionsimport where projdate is not null --->
    UPDATE audprojects p
    INNER JOIN auditionsimport i 
        ON i.audprojectid = p.audprojectid
    SET p.projdate = i.projdate
    WHERE STR_TO_DATE(i.projdate, '%Y-%m-%d') IS NOT NULL;
</cfquery>
