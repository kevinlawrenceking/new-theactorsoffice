<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Debug Log Viewer</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-5">
        <h1 class="mb-4">Debug Log Viewer</h1>
        <table id="debugLogTable" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Filename/Path</th>
                    <th>Debug Details</th>
                    <th>Timestamp</th>
                </tr>
            </thead>
            <tbody>
    
                <cfquery name="debugLogs" datasource="yourDatasource">
                    SELECT 
                        id,
                        filename,
                        debugDetails,
                        timestamp
                    FROM debugLog
                    ORDER BY timestamp DESC
                </cfquery>

                <cfoutput query="debugLogs">
                    <tr>
                        <td>#id#</td>
                        <td>#filename#</td>
                        <td>
                            <button class="btn btn-link btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="##details-#id#" aria-expanded="false" aria-controls="details-#id#">
                                View Details
                            </button>
                            <div class="collapse" id="details-#id#">
                                <div class="card card-body debug-details">
                                    <cfoutput>#debugDetails#</cfoutput>
                                </div>
                            </div>
                        </td>
                        <td>#timestamp#</td>
                    </tr>
                </cfoutput>
            </tbody>
        </table>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>


    <script>
        $(document).ready(function () {
            $('#debugLogTable').DataTable();
        });

        // JSON Parsing for Debug Details
        document.addEventListener('DOMContentLoaded', () => {
            document.querySelectorAll('.debug-details').forEach((element) => {
                try {
                    const json = JSON.parse(element.textContent);
                    element.innerHTML = `<pre>${JSON.stringify(json, null, 2)}</pre>`;
                } catch (e) {
                    element.innerHTML = `<pre>${element.textContent}</pre>`;
                }
            });
        });
    </script>
</body>
</html>
