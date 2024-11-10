<!--- This ColdFusion page processes audition locations and project details based on the provided parameters. --->
<cfif new_audlocid is "custom"> 
    <!--- Check if the new audition location ID is custom and include the relevant query. --->
    <cfinclude template="/include/qry/audlocations_ins_218_1.cfm" /> 
    <cfset new_audlocid = result.generatedkey /> 
</cfif> 

<!--- Include the project query to retrieve project details. --->
<cfinclude template="/include/qry/findproject_218_2.cfm" /> 

<cfset newProjName = findproject.projname /> <!--- Standardized variable names and casing. --->
<cfset newProjDescription = findproject.projdescription /> <!--- Standardized variable names and casing. --->
<cfset newContactId = findproject.contactid /> <!--- Standardized variable names and casing. --->

<!--- Include the auditions insert query. --->
<cfinclude template="/include/qry/auditions_ins.cfm" /> 

<!--- Prepare the return URL for redirection after processing. --->
<cfset returnurl = "/app/audition/?audprojectid=" & audprojectid & "&eventid=" & new_eventid & "&secid=" & secid & "&focusid=" & focusid /> <!--- Removed unnecessary cfoutput tags around variable outputs. --->

<!--- Redirect to the prepared return URL. --->
<cflocation url="#returnurl#" />

<!--- Changes were made according to standards 2, 5. --->