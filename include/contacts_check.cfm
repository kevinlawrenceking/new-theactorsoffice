<!--- This ColdFusion page includes different contact templates based on the device type (mobile or desktop) --->
<cfif #devicetype# is "mobile">
    <!--- Include the template for mobile contacts --->
    <cfinclude template="/include/contacts_all.cfm">
<cfelse>
    <!--- Include the template for desktop contacts --->
    <cfinclude template="/include/contacts.cfm">
</cfif>
