<cfset contactService = createObject("component", "services.ContactService")>
<cfset qFiltered = contactService.getFilteredContactsByEvent(
    contacts_table = contacts_table,
    userid = userid,
    eventid = eventid
)>

<table id="<cfoutput>#contacts_table#</cfoutput>" style="width:100%;" class="table display dt-responsive nowrap w-100 table-striped" role="grid">
    <thead>
        <tr>
            <th></th>
            <th>Name</th>
            <th>Tags</th>
            <th>Company</th>
            <th>Phone</th>
            <th>Email</th>
        </tr>
    </thead>
    <tbody>
        <cfoutput query="qFiltered">
            <tr>
                <td>#contactid#</td>
                <td>#col1#</td> <!-- Assuming "Name" -->
                <td>#col2#</td> <!-- Assuming "Tags" -->
                <td>#col3#</td> <!-- Assuming "Company" -->
                <td>#col4#</td> <!-- Assuming "Phone" -->
                <td>#col5#</td> <!-- Assuming "Email" -->
            </tr>
        </cfoutput>
    </tbody>
</table>
