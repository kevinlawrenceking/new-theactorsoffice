<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Debug Log Viewer</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
    <style>
        pre {
            white-space: pre-wrap;
            word-wrap: break-word;
        }
    </style>
</head>
<body>
<div class="container my-4">
    <h1 class="mb-4">Debug Log Viewer</h1>
    <table id="debugLogTable" class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Filename</th>
                <th>Timestamp</th>
                <th>Details</th>
            </tr>
        </thead>
        <tbody>
            <cfoutput query="debugLog">
                <tr>
                    <td>#id#</td>
                    <td>#filename#</td>
                    <td>#timestamp#</td>
                    <td>
                        <pre class="json-details" data-json="#htmlEditFormat(debugdetails)#"></pre>
                    </td>
                </tr>
            </cfoutput>
        </tbody>
    </table>
</div>

<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Include DataTables JS -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        // Initialize DataTable
        $('#debugLogTable').DataTable();

        // Parse and pretty-print JSON details
        $('.json-details').each(function () {
            const jsonData = $(this).data('json');
            try {
                const parsedData = JSON.parse(jsonData);
                $(this).text(JSON.stringify(parsedData, null, 2));
            } catch (e) {
                $(this).text('Invalid JSON');
            }
        });
    });
</script>
</body>
</html>
