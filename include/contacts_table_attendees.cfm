<table id="contacts_table" style="width:100%;" class="table display dt-responsive nowrap w-100 table-striped" role="grid"> 
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
</table>

<script type="text/javascript"> 
    $(document).ready(function() { 
        var table = $('#contacts_table').DataTable({ 
            "dom": 'frtip', 
            "pageLength": defrows, 
            stateSave: false, 
            serverSide: true, 
            ajax: { url: '/include/contacts_attendees.cfm?eventid=' + eventid + '&contacts_table=contacts_table&userid=' + session.userid, type: 'post' }, 
            responsive: { details: { type: 'column' } }, 
            columnDefs: [{ targets: 0, checkboxes: { selectRow: true } }], 
            select: { style: 'multi' }, 
            order: [ [1, 'asc'] ], 
            language: { infoEmpty: "No records available" } }); 

        $('#myform').on('submit', function(e) { 
            var form = this; 
            var rows_selected = table.column(0).checkboxes.selected(); 

            $.each(rows_selected, function(index, rowId) { 
                $(form).append( $('<input>') .attr('type', 'hidden') .attr('name', 'idlist') .val(rowId) ); }); }); 

        $('#myformtag').on('submit', function(e) { 
            var formtag = this; 
            var rows_selectedtag = table.column(0).checkboxes.selected(); 

            $.each(rows_selectedtag, function(index, rowId) { 
                $(formtag).append( $('<input>') .attr('type', 'hidden') .attr('name', 'idlist') .val(rowId) ); }); }); 

        $('#buttonz').click(function() { 
            var numChecked = table.column(0).checkboxes.selected(); 
            $('log').html(numChecked); }); }); 
</script> 

<script> 
    var countChecked = function() { 
        var n = $("input:checked").length; 
        $("#count").text(n + (n === 1 ? " is" : " zijn") + " aangevinkt!"); 

        if (n == 0) { 
            $("#batchbutton_contacts_table:visible").fadeOut(); 
        } else { 
            $("#batchbutton_contacts_table:hidden").fadeIn(); 
        } }; 

    countChecked(); 

    $("input[type=checkbox]").on("click", countChecked); 
</script> 

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), ' \')#" />

<!--- Changes made: Removed unnecessary cfoutput tags around variable outputs, avoided using # symbols within conditional checks, standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting. --->