<cfset ContactItemService = createObject("component", "services.ContactItemService")>
<cfset result = contactItemService.INScontactitems_24404(contactid=tag.contactid, new_tag1=new_tag1)>
<cfdump var="#result#" >