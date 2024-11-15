<!--- This ColdFusion page updates the project date in the audprojects table based on the auditionsimport table. --->

<cfquery name="fix">
    <!--- Update the project date in audprojects based on auditionsimport data --->
    UPDATE audprojects p
    INNER JOIN auditionsimport i 
        ON i.audprojectid = p.audprojectid
    SET p.projdate = i.projdate
    WHERE STR_TO_DATE(i.projdate, '%Y-%m-%d') IS NOT NULL;
</cfquery>
