<!--- Parameter initialization --->
<cfparam name="newPnIds" default="" />

<!--- Include query templates --->
<cfinclude template="/include/qry/x_94_1.cfm" />
<cfinclude template="/include/qry/pgPanels_94_2.cfm" />

<!--- Redirect to account page --->
<cflocation url="/app/myAccount/?t1=1" />

<!--- Changes: Standardized variable names and casing (Rule 5), ensured consistent attribute quoting, spacing, and formatting (Rule 6) --->