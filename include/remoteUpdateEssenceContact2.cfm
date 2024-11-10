<!--- Parameter Initialization --->
<cfparam name="isDeleted" default="0" />

<!--- Query Template Inclusion --->
<cfinclude template="/include/qry/update_264_1.cfm" />

<!--- User Redirection --->
<cflocation url="/app/myaccount/?t3=1&tab3_expand=true" />

<!--- Changes Made: 
1. Standardized variable names and casing.
--->