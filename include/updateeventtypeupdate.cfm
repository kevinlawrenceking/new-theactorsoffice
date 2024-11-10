<!--- This ColdFusion page handles the deletion of a link and redirects to the calendar appointment page. --->
<cfparam name="deleteLink" default="0" /> <!--- Standardized variable names and casing --->
<!--- Include the update query template for processing the deletion. --->
<cfinclude template="/include/qry/update_310_1.cfm" />
<!--- Redirect to the calendar appointment page with the specified legend status. --->
<cflocation url="/app/calendar-appoint/?legendStatus=show" /> <!--- Standardized variable names and casing --->

<!--- Modifications were made based on standards 5. --->