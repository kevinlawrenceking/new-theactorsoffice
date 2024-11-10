<!--- This ColdFusion page processes user IDs and labels, ensuring they are set to default values if not provided. It includes necessary query files for data retrieval and insertion. --->
<cfinclude template="/include/qry/findid_146_1.cfm" />

<!--- Set new_ID from the query result --->
<cfset newID = findid.new_id />

<!--- Check if newID is empty and set to 0 if true --->
<cfif IsDefined("newID") AND newID is "">
    <cfset newID = 0 />
</cfif>

<!--- Check if userID is empty and set to 0 if true --->
<cfif IsDefined("userID") AND userID is "">
    <cfset userID = 0 />
</cfif>

<!--- Replace single quotes in newLabel and store in newLabelNew --->
<cfset newLabelNew = Replace(new_label, '''', '', 'All') />

<cfinclude template="/include/qry/Insert_ReportItems_146_2.cfm" />

<!--- Changes: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Used IsDefined function to check if a variable exists before checking its value.
--->