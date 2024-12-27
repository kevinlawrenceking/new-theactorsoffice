<cfset contactItemService = createObject("component", "services.ContactItemService")>
<cfset contactItemService.addContactItemsTag(contactid=tag.contactid, new_tag=new_tag3)>
<cfdump var="#result#" >