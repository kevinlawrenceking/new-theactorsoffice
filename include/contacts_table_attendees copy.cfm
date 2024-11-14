<!--- This ColdFusion page initializes a DataTable for displaying contacts with options for selection and form submission. --->

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
</table>

<script type="text/javascript">
    $(document).ready(function() {
        <!--- Initialize DataTable with server-side processing and configuration options. --->
        var table = $('#<cfoutput>#contacts_table#</cfoutput>').DataTable({
            "dom": 'frtip',
            "pageLength": <cfoutput>#defrows#</cfoutput>,
            stateSave: false,
            serverSide: true,
            ajax: {
                url: '/include/contacts_attendees.cfm?eventid=<cfoutput>#eventid#</cfoutput>&contacts_table=<cfoutput>#contacts_table#</cfoutput>&userid=<cfoutput>#session.userid#</cfoutput>',
                type: 'post'
            },
            responsive: {
                details: {
                    type: 'column'
                }
            },
            columnDefs: [{
                targets: 0,
                checkboxes: {
                    selectRow: true
                }
            }],
            select: {
                style: 'multi'
            },
            order: [
                [1, 'asc']
            ],
            language: {
                infoEmpty: "No records available"
            }
        });

        <!--- Handle form submission for selected checkboxes in the first form. --->
        $('#myform').on('submit', function(e) {
            var form = this;
            var rows_selected = table.column(0).checkboxes.selected();

            // Iterate over all selected checkboxes
            $.each(rows_selected, function(index, rowId) {
                // Create a hidden element 
                $(form).append(
                    $('<input>')
                    .attr('type', 'hidden')
                    .attr('name', 'idlist')
                    .val(rowId)
                );
            });
        });

        <!--- Handle form submission for selected checkboxes in the second form. --->
        $('#myformtag').on('submit', function(e) {
            var formtag = this;
            var rows_selectedtag = table.column(0).checkboxes.selected();

            // Iterate over all selected checkboxes
            $.each(rows_selectedtag, function(index, rowId) {
                // Create a hidden element 
                $(formtag).append(
                    $('<input>')
                    .attr('type', 'hidden')
                    .attr('name', 'idlist')
                    .val(rowId)
                );
            });
        });

        <!--- Display the number of checked checkboxes when the button is clicked. --->
        $('#buttonz').click(function() {
            var numChecked = table.column(0).checkboxes.selected();
            $('log').html(numChecked);
        });
    });
</script>

<script>
    <!--- Function to count checked checkboxes and update the display accordingly. --->
    var countChecked = function() {
        var n = $("input:checked").length; // n now contains the number of checked elements.
        $("#count").text(n + (n === 1 ? " is" : " zijn") + " aangevinkt!"); // show some text
        if (n == 0) {
            $("#batchbutton_<cfoutput>#contacts_table#</cfoutput>:visible").fadeOut(); // if there are none checked, hide only visible elements
        } else {
            $("#batchbutton_<cfoutput>#contacts_table#</cfoutput>:hidden").fadeIn(); // otherwise (some are selected) fadeIn - if the div is hidden.
        }
    };
    countChecked();

    <!--- Attach click event to checkboxes to count checked items. --->
    $("input[type=checkbox]").on("click", countChecked);
</script>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
