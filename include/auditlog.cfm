<div class="row"> 
    <div class="col-12"> 
        <div class="card"> 
            <div class="card-body"> 
                <h4 class="header-title">User Activity</h4> 
                <p class="text-muted font-13 mb-4"></p> 
                <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped" role="grid"> 
                    <thead> 
                        <!--- Loop through the results to create table headers --->
                        <cfloop query="results" endrow="1">
                            <cfset rowType = (currentRow MOD 2) ? "Odd" : "Even" />
                            <tr class="#rowType#">
                                <th>#head1#</th> 
                                <th>#head2#</th> 
                                <th>#head3#</th> 
                                <th>#head4#</th> 
                                <th>#head6#</th> 
                                <th>#head7#</th> 
                            </tr>
                        </cfloop>
                    </thead> 
                    <tbody> 
                        <!--- Loop through the results to create table rows --->
                        <cfloop query="results">
                            <tr>
                                <td>#col1#</td> 
                                <td>#DateFormat(col2, "long")#</td> 
                                <td>#TimeFormat(col3, "medium")#</td> 
                                <td>#col4#</td> 
                                <td>#col6#</td> 
                                <td>#col7#</td>
                            </tr>
                        </cfloop>
                    </tbody>
                </table>
            </div><!--- end card body --->
        </div><!--- end card --->
    </div><!--- end col --->
</div>

<SCRIPT>
    $(document).ready(function() {
        // Initialize DataTable for basic-datatable
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

        // Initialize DataTable for datatable-buttons
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
</SCRIPT>

<!--- Modifications made based on standards:
1. Removed unnecessary <cfoutput> tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Used uniform date and time formatting across the code.
6. Removed cftry and cfcatch blocks entirely.
7. For any # symbols inside <cfoutput> blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs ## to avoid interpretation as variables.
--->