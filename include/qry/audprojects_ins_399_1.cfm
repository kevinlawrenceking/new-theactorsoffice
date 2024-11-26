<cfset auditionProjectService = createObject("component", "services.AuditionProjectService")>

<!-- Initialize a struct for dynamic arguments -->
<cfset dynamicVars = {
    new_projName = new_projName,
    new_projDescription = new_projDescription,
    new_userid = new_userid
}>

<!-- Add optional variables conditionally -->
<cfif structKeyExists(variables, "new_audSubCatID") AND isNumeric(new_audSubCatID)>
    <cfset dynamicVars["new_audSubCatID"] = new_audSubCatID>
</cfif>

<cfif structKeyExists(variables, "new_unionID") AND isNumeric(new_unionID)>
    <cfset dynamicVars["new_unionID"] = new_unionID>
</cfif>

<cfif structKeyExists(variables, "new_networkID") AND isNumeric(new_networkID)>
    <cfset dynamicVars["new_networkID"] = new_networkID>
</cfif>

<cfif structKeyExists(variables, "new_toneID") AND isNumeric(new_toneID)>
    <cfset dynamicVars["new_toneID"] = new_toneID>
</cfif>

<cfif structKeyExists(variables, "new_contractTypeID") AND isNumeric(new_contractTypeID)>
    <cfset dynamicVars["new_contractTypeID"] = new_contractTypeID>
</cfif>

<cfif structKeyExists(variables, "new_isDeleted") AND isNumeric(new_isDeleted)>
    <cfset dynamicVars["new_isDeleted"] = new_isDeleted>
</cfif>

<cfif structKeyExists(variables, "isdirect") AND isNumeric(isdirect)>
    <cfset dynamicVars["isdirect"] = isdirect>
</cfif>

<cfif structKeyExists(variables, "new_contactid") AND isNumeric(new_contactid)>
    <cfset dynamicVars["new_contactid"] = new_contactid>
</cfif>

<!-- Call the function with the dynamic struct -->
<cfset new_audprojectID = auditionProjectService.INSaudprojects_24585(argumentCollection=dynamicVars)>
