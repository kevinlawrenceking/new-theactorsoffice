<!--- This ColdFusion page initializes parameters and includes a query for audplatforms --->
<cfparam name="new_audplatform" default="" />
<cfparam name="new_isDeleted" default="0" />

<!--- Include the query for audplatforms --->
<cfinclude template="/include/qry/audplatforms_ins_393_1.cfm" />

<!--- Set the new audplatform ID from the query result --->
<cfset new_audplatformid = result.GENERATEDKEY />
