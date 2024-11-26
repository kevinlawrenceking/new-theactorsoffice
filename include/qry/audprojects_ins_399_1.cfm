<cfset argumentsStruct = {
    new_projName = new_projName,
    new_projDescription = new_projDescription,
    new_userid = new_userid
}>

<cfif structKeyExists(arguments, "new_audSubCatID") AND isNumeric(arguments.new_audSubCatID)>
    <cfset argumentsStruct["new_audSubCatID"] = new_audSubCatID>
</cfif>

<cfif structKeyExists(arguments, "new_unionID") AND isNumeric(arguments.new_unionID)>
    <cfset argumentsStruct["new_unionID"] = new_unionID>
</cfif>

<cfif structKeyExists(arguments, "new_networkID") AND isNumeric(arguments.new_networkID)>
    <cfset argumentsStruct["new_networkID"] = new_networkID>
</cfif>

<cfif structKeyExists(arguments, "new_toneID") AND isNumeric(arguments.new_toneID)>
    <cfset argumentsStruct["new_toneID"] = new_toneID>
</cfif>

<cfif structKeyExists(arguments, "new_contractTypeID") AND isNumeric(arguments.new_contractTypeID)>
    <cfset argumentsStruct["new_contractTypeID"] = new_contractTypeID>
</cfif>

<cfif structKeyExists(arguments, "new_isDeleted") AND isNumeric(arguments.new_isDeleted)>
    <cfset argumentsStruct["new_isDeleted"] = new_isDeleted>
</cfif>

<cfif structKeyExists(arguments, "isdirect") AND isNumeric(arguments.isdirect)>
    <cfset argumentsStruct["isdirect"] = isdirect>
</cfif>

<cfif structKeyExists(arguments, "new_contactid") AND isNumeric(arguments.new_contactid)>
    <cfset argumentsStruct["new_contactid"] = new_contactid>
</cfif>

<cfset new_audprojectID = auditionProjectService.INSaudprojects_24585(argumentCollection=argumentsStruct)>
