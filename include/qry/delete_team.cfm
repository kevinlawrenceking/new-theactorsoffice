<cfcontent type="application/json">
<cftry>
    <cfparam name="form.contactid" type="integer">

    <!--- Call the ColdFusion function to delete the contact --->
    <cfset contactItemService = createObject("component", "services.contactItemService")>
    <cfset contactItemService.deleteTeam(contactid=form.contactid)>

    <!--- Return JSON response --->
    <cfoutput>#serializeJSON({ "success": true, "message": "Contact removed successfully." })#</cfoutput>

<cfcatch>
    <cfoutput>#serializeJSON({ "success": false, "message": cfcatch.message })#</cfoutput>
</cfcatch>
</cftry>

