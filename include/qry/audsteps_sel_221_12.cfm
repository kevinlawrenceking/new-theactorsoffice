<!--- This ColdFusion page retrieves active audit steps from the database for display. --->

<cfquery name="audsteps_sel">
    <!--- Query to select active audit steps from the audsteps table --->
    SELECT audstepid AS id,
           audstep AS NAME
    FROM audsteps
    WHERE isdeleted = 0
    ORDER BY audstep
</cfquery>
