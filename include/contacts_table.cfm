<!--- This ColdFusion page manages contact data display and interactions, including importing, exporting, and managing tags and systems. --->

<div class="table-responsive" id="<cfoutput>#contacts_table#_container</cfoutput>">
    <table id="<cfoutput>#contacts_table#</cfoutput>" class="table display nowrap table-striped dataTable w-95 dtr-inline dt-checkboxes-select dt-responsive">
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
        <tfoot>
            <tr>
                <th></th>
                <th>Name</th>
                <th class="min-phone-l">Tags</th>
                <th class="min-phone-l">Company</th>
                <th class="min-phone-l">Phone</th>
                <th class="min-phone-l">Email</th>
            </tr>
        </tfoot>
    </table>
</div>

<cfinclude template="/include/qry/imports.cfm" />
<cfset defrows = defrows />

<script type="text/javascript">
$(document).ready(function() {
    var table = $('#<cfoutput>#contacts_table#</cfoutput>').DataTable({
        "pageLength": <cfoutput>#defaultRowsValue#</cfoutput>,
        "lengthMenu": [[10, 25, 50, 100, 500, 9999999], [10, 25, 50, 100, 500, "All"]],
        "searching": true,
        stateSave: false,
        dom: '<"row"<"col-sm-12"f>> <"row"<"col-sm-12"B>> <"row"<"col-sm-12"l>>rtip',
        responsive: {
            details: {
                type: 'column'
            }
        },
        serverSide: true,
        ajax: {
            url: '/include/contacts_ss.cfm?contacts_table=<cfoutput>#contacts_table#</cfoutput>&userid=<cfoutput>#userid#</cfoutput>&bytag=<cfoutput>#bytag#</cfoutput>&byimport=<cfoutput>#byimport#</cfoutput>',
            type: 'post'
        },
        buttons: [
            {
                text: 'Add System',
                className: 'updatesystem',
                action: function() {
                    updateIdList('#myformsystem');
                    $('#exampleModal3').modal('show');
                },
                enabled: false
            },
            {
                text: 'Delete',
                className: 'batchdelete',
                action: function() {
                    updateIdList('#myformdelete');
                    $('#exampleModaldelete').modal('show');
                },
                enabled: false
            },
            {
                text: 'Export',
                className: 'exportcontacts',
                action: function() {
                    updateIdList('#myformexport');
                    $('#exampleModal5').modal('show');
                },
                enabled: false
            }
        ],
        columnDefs: [{
            targets: 0,
            checkboxes: {
                selectRow: true
            }
        }],
        select: {
            style: 'multi'
        }
    });

    // Function to update ID list before showing the modal
    function updateIdList(formSelector) {
        var selectedIds = table.column(0).checkboxes.selected().toArray().join(",");
        $(formSelector).find('input[name="id_list"]').remove(); // Remove existing hidden input
        $(formSelector).append(
            $('<input>').attr('type', 'hidden').attr('name', 'id_list').val(selectedIds)
        );
    }

    // Enable/disable buttons based on selection
    $('#<cfoutput>#contacts_table#</cfoutput>').on('select.dt deselect.dt', function() {
        var hasSelection = table.rows({ selected: true }).indexes().length > 0;
        table.buttons(['.exportcontacts', '.updatesystem', '.batchdelete']).enable(hasSelection);
    });
});


</script>

<script>
    // Count checked checkboxes and update UI
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

    $("input[type=checkbox]").on("click", countChecked);
</script>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />
