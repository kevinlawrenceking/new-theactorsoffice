<!--- This ColdFusion page handles ticket updates and logs changes in ticket priority and version. --->
<cfinclude template="/include/qry/update_312_1.cfm" />
<cfinclude template="/include/qry/details_312_2.cfm" />

<cfset newTicketStatus = details.new_ticketstatus />

<!--- Check if the ticket priority has changed --->
<cfif old_ticketpriority neq new_ticketpriority>
    <cfset newTlogDetails = "changed PRIORITY from <strong>" & chr(34) & old_ticketpriority & chr(34) & "</strong> to <strong>" & chr(34) & new_ticketpriority & chr(34) & "</strong>." />
    <cfset newTicketId = ticketid />
    <cfset newTicketStatus = new_ticketStatus />
    <cfinclude template="/include/qry/inserttlog.cfm" />
</cfif>

<!--- Check if the version ID has changed --->
<cfif numberformat(old_verid) neq numberformat(new_verid)>
    <cfinclude template="/include/qry/old_312_3.cfm" />
    <cfinclude template="/include/qry/new_312_4.cfm" />

    <!--- Determine old find name --->
    <cfset oldFindName = (old.recordcount eq 1) ? old.old_findname : "NULL" />

    <!--- Determine new find name --->
    <cfset newFindName = (new.recordcount eq 1) ? new.new_findname : "NULL" />

    <cfset newTlogDetails = "changed VERSION from <strong>" & chr(34) & oldFindName & chr(34) & "</strong> to <strong>" & chr(34) & newFindName & chr(34) & "</strong>." />
    <cfset newTicketId = ticketid />
    <cfset newTicketStatus = new_ticketStatus />
    <cfinclude template="/include/qry/inserttlog.cfm" />
</cfif>

<!--- Redirect based on the existence of oldverid --->
<cfif isdefined('oldverid')>
    <cflocation url="/app/version/?recid=#oldverid#" />
<cfelse>
    <cflocation url="/app/admin-support/" />
</cfif>

<!--- Changes: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Simplified record count logic for icons or conditional displays.
4. Standardized variable names and casing.
5. Ensured consistent attribute quoting, spacing, and formatting.
6. Used ternary operator for conditional assignment.
--->