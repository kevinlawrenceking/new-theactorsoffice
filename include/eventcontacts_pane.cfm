<!--- This ColdFusion page sets up the contacts table and includes the attendees template for the event. --->
<cfset contactsTable = "contacts_attendees" />
<cfset eventId = eventdetails.eventid />
<!--- Include the contacts table attendees template --->
<cfinclude template="/include/contacts_table_attendees.cfm" />

<!--- Changes made based on rules: 2, 5, 6 --->