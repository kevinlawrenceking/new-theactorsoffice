<cfset projectService = createObject("component", "services.AuditionProjectService")>
<cfset projectArgs = {
    new_projName = new_projName,
    new_audprojectID = new_audprojectID
}>

<cfif len(trim(new_projDescription))>
    <cfset projectArgs.new_projDescription = new_projDescription>
</cfif>
<cfif len(trim(new_unionID))>
    <cfset projectArgs.new_unionID = new_unionID>
</cfif>
<cfif len(trim(new_networkID))>
    <cfset projectArgs.new_networkID = new_networkID>
</cfif>
<cfif len(trim(new_toneID))>
    <cfset projectArgs.new_toneID = new_toneID>
</cfif>
<cfif len(trim(new_contractTypeID))>
    <cfset projectArgs.new_contractTypeID = new_contractTypeID>
</cfif>
<cfif len(trim(new_contactid))>
    <cfset projectArgs.new_contactid = new_contactid>
</cfif>

<cfset projectService.UPDaudprojects_24586(argumentCollection=projectArgs)>

