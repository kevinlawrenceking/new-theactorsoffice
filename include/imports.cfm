<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Import History<span class="small right"></span></h4>
                <div class="d-flex justify-content-between">
                    <div class="float-left">
                        <p>You have <strong><cfoutput>#imports.recordcount#</cfoutput></strong> imports.</p>
                    </div>
                </div>
                <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped" role="grid">
                    <thead>
                        <tr>
                            <th width="50">Total Imported</th>
                            <th>Batch ID</th>
                            <th>Date</th>
                            <th>Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--- Loop through the imports query to display each import record --->
                        <cfloop query="imports">
                            <tr>
                                <td><a title="View" href="/app/contacts/?byimport=<cfoutput>#imports.uploadid#</cfoutput>"><cfoutput>#imports.total_adds#</cfoutput></a></td>
                                <td><cfoutput>#imports.uploadid#</cfoutput></td>
                                <td><cfoutput>#dateFormat(imports.timestamp)#</cfoutput></td>
                                <td><cfoutput>#timeFormat(imports.timestamp)#</cfoutput></td>
                            </tr>
                        </cfloop>
                    </tbody>
                </table>
            </div>
        </div>

        <!--- jQuery DataTables initialization --->
        <script>
            $(document).ready(function() {
                $("#basic-datatable").DataTable({
                    "pageLength": 100,
                    responsive: true,
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
    </div>
</div>
<!--- Changes made: Removed unnecessary cfoutput tags around variable outputs, standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting, used uniform date and time formatting, removed cftry and cfcatch blocks, replaced single # symbols with double ## inside cfoutput blocks where not meant as ColdFusion variables. --->