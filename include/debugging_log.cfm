<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Debug Log</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTable CSS -->
    <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h1 class="text-center mb-4">Debug Log</h1>

    <div class="table-responsive">
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
                <!-- Fetch debug log entries -->
                <cfquery name="debugLogs" >
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
                        <td><pre>#debugDetails#</pre></td>
                        <td>#timestamp#</td>
                    </tr>
                </cfoutput>
            </tbody>
        </table>
    </div>
</div>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- DataTable JS -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function() {
        $('#debugLogTable').DataTable({
            order: [[3, 'desc']], // Sort by timestamp (4th column, descending)
            pageLength: 10, // Number of rows per page
            responsive: true
        });
    });
</script>

</body>
</html>
