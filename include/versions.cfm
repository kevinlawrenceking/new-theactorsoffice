<div class="row"> 
    <div class="col-12"> 
        <div class="card"> 
            <div class="card-body"> 
                <div class="d-flex justify-content-between align-items-center"> 
                    <h4 class="header-title">Versions</h4> 
                    <a href="/app/version-add/"> 
                        <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="button" style="background-color: ##406e8e; border: ##406e8e;"> Add </button> 
                    </a> 
                </div> 
                <p class="text-muted font-13 mb-4"></p> 
                <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped" role="grid"> 
                    <thead> 
                        <!--- Loop through query results to create table header rows --->
                        <cfloop query="results" endrow="1"> 
                            <cfset rowType = (results.CurrentRow MOD 2) ? "Odd" : "Even" />
                            <tr class="#rowType#"> 
                                <th>#head1#</th> 
                                <th>#head2#</th> 
                                <th>#head3#</th> 
                                <th>#head4#</th> 
                                <th>#head4b#</th> 
                                <th>#head5#</th> 
                                <th>#head6#</th> 
                            </tr>
                        </cfloop>
                    </thead>
                    <tbody>
                        <!--- Loop through query results to create table body rows --->
                        <cfloop query="results">
                            <cfset verWeight = results.isActive ? "700" : "400" />
                            <tr>
                                <td style="font-weight:##verWeight##;">
                                    <a href="/app/version/?recid=#results.verid#">#results.col1#</a>
                                </td>
                                <td style="font-weight:##verWeight##;">#DateFormat(results.col2, "mmm-dd-yyyy")#</td>
                                <td style="font-weight:##verWeight##;">#DateFormat(results.col3, "mmm-dd-yyyy")#</td>
                                <td style="font-weight:##verWeight##;">#results.col4#</td>
                                <td style="font-weight:##verWeight##;">#results.col4b#</td>
                                <td style="font-weight:##verWeight##;">#results.col5#</td>
                                <td style="font-weight:##verWeight##;"> #numberformat(results.col6,9.99)# </td>
                            </tr>
                        </cfloop>
                    </tbody> 
                </table> 
            </div> <!--- end card body --->
        </div> <!--- end card --->
    </div> <!--- end col --->
</div>

<script> 
$(document).ready(function() { 
    // Initialize DataTable with specific settings 
    $("#basic-datatable").DataTable({ 
        "iDisplayLength": 100, 
        language: { 
            paginate: { 
                previous: "<i class='mdi mdi-chevron-left'>", 
                next: "<i class='mdi mdi-chevron-right'>" 
            } 
        }, 
        drawCallback: function() { 
            $(".dataTables_paginate > .pagination").addClass("pagination-rounded") 
        } 
    }); 

    // Initialize another DataTable with buttons 
    var a = $("#datatable-buttons").DataTable({ 
        lengthChange: !1, 
        buttons: [
            { extend: "copy", className: "btn-light" }, 
            { extend: "print", className: "btn-light" }, 
            { extend: "pdf", className: "btn-light" }
        ], 
        language: { 
            paginate: { 
                previous: "<i class='mdi mdi-chevron-left'>", 
                next: "<i class='mdi mdi-chevron-right'>" 
            } 
        }, 
        drawCallback: function() { 
            $(".dataTables_paginate > .pagination").addClass("pagination-rounded") 
        } 
    }); 
}); 
</script>

<!--- Modifications made based on standards:
1. Simplified conditional logic for rowType and verWeight.
2. Removed unnecessary cfoutput tags.
3. Avoided using # symbols within conditional checks.
4. Standardized variable names and casing.
5. Used double pound signs ## for hex color codes in style attributes.
--->