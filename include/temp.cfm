I'm trying to optimize into one query.

An audition project date (projdate) is either the date entered when it doesn't have events (appointments) linked to it.

When it does have events link to it, we want to ensure its update and has the latest date of the events (min(events.eventStart)) 

To do so, I'd first have a query to NULL out the projdate of all audition projects (audprojects) that are linked to one or more events.

I then do a select query that gives me a table of the project and new project date (query 2)

i then loop through query 2 and update all of the null project dates that have events linked to the latest proj date.


Optimize this:

query 1
UPDATE audprojects 
        SET projdate = NULL 
        WHERE isdeleted <> 1 
        AND audprojectid IN (
            SELECT r.audprojectid 
            FROM audroles r 
            INNER JOIN events e ON e.audRoleID = r.audroleid
            WHERE r.audprojectid IN (
                <cfqueryparam value="#arguments.audprojectids#" cfsqltype="CF_SQL_INTEGER" list="true">
            )
        )


query 2
         SELECT p.audprojectID,min(a.eventStart) AS new_projDate
    FROM events a
    INNER JOIN audroles r ON r.audroleid = a.audroleid
    
    INNER JOIN audprojects p on p.audprojectid = r.audprojectid
    WHERE r.isDeleted <> 1
    
    AND a.isdeleted <> 1
    AND a.eventStart IS NOT NULL
    and r.isdeleted <> 1
    and p.isdeleted <> 1
    AND a.eventStart >= CURDATE()
    AND p.projdate IS null
	 GROUP BY p.audprojectID 