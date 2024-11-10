<!--- This ColdFusion page processes audition location data and redirects the user to a specific URL based on parameters. --->
<cfinclude template="/include/qry/audlocations_ins_58_1.cfm" />

<!--- Set the return URL based on audition project, event, section, and focus IDs. --->
<cfset returnurl = "/app/audition/?audprojectid=" & audprojectid & "&eventid=" & eventid & "&secid=181&focusid=" & focusid />

<!--- Redirect the user to the constructed return URL. --->
<cflocation url="#returnurl#" />

<!--- Changes made: 
1. Removed unnecessary <cfoutput> tags around variable outputs.
2. Avoided using # symbols within conditional checks unless essential.
--->