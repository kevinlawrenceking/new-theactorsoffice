<!--- This ColdFusion page initializes parameters and includes a query template for processing audit question types. --->

<cfparam name="new_qtype" default="" />
<cfparam name="new_isDeleted" default="0" />

<!--- Include the query template for audit question types. --->
<cfinclude template="/include/qry/audqtypes_ins_402_1.cfm" />

<!--- Set the new question type ID from the query result. --->
<cfset new_qtypeid = result.GENERATEDKEY />
