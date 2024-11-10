<!--- Initialize parameters ---> 
<cfparam name="idList" default="0" />

<!--- Include the query for updating records. ---> 
<cfinclude template="/include/qry/update_101_1.cfm" />

<!--- Redirect to the contacts page without adding a token. ---> 
<cflocation url="/app/contacts/" addtoken="no" />

<!--- Changes: Standardized variable names and casing (Rule 5) --->