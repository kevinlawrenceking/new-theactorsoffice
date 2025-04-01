<cfset contactItemService = createObject("component", "services.ContactItemService") />
<cfif myteam.contactid eq ""><cfset myteam_contactid = 0><cfelse><cfset myteam_contact_id = myteam.contactid></cfif>
<cfset findtag = contactItemService.SELcontactitems_23855(contactid=myteam.contactid) />