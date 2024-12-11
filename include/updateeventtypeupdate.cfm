<!--- This ColdFusion page handles the deletion of a link and redirects to the calendar appointment page. --->102

<cfparam name="deletelink" default="0" /> 

<!--- Include the update query template for processing the deletion. --->
<cfinclude template="/include/qry/update_310_1.cfm" />

<!--- Redirect to the calendar appointment page with the specified legend status. --->
<cflocation url="/app/calendar-appoint/?legendstatus=show" />
