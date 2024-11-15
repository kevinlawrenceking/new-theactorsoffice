<!--- This ColdFusion page updates the contact information in the contactsimport table based on the provided status and contact ID. --->

<cfquery name="update_contact">
    <!--- Update contactsimport table with new status and contact ID based on the provided ID --->
    Update contactsimport
    set status = '#new_status#',
        contactid = #new_contactid#
    where id = #x.id#
</cfquery>
