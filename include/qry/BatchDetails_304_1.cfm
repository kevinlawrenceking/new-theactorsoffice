<cfset contactService = createObject("component", "services.ContactService")>
<cfset BatchDetails = contactService.DETcontactdetails_24340(idList=idlist)>

<cfoutput>#BatchDetails#</cfoutput><cfabort>