<!--- Set default value for contact ID if not provided --->
<cfparam name="contactId" default="0" />

<!--- Include the query template for adding a record --->
<cfinclude template="/include/qry/bro_add_53_1.cfm" />

<!--- Modifications based on standards: 
1. Removed cftry and cfcatch blocks as per standard 9.
2. Standardized variable names and casing as per standard 5. --->