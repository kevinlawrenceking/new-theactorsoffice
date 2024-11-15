<!--- This ColdFusion page deletes records from the eventcontactsxref table where the eventid does not exist in the events table. --->

<cfquery name="remove">
    <!--- Delete records from eventcontactsxref where eventid is not in events table --->
    DELETE FROM eventcontactsxref 
    WHERE eventid NOT IN (
        SELECT eventid 
        FROM events
    );
</cfquery>
