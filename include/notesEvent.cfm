<!--- This ColdFusion page initializes parameters and includes templates for event notes and contact details. --->
<cfparam name="eventId" default="0" /> <!--- Set default value for event ID --->
<cfparam name="updateNoteId" default="0" /> <!--- Set default value for update note ID --->

<cfinclude template="/include/qry/notesEvent_180_1.cfm" /> <!--- Include template for event notes --->
<cfinclude template="/include/qry/notesContactDetails_180_2.cfm" /> <!--- Include template for contact details --->

<!--- Changes: Standardized variable names and casing (Rule 5). --->