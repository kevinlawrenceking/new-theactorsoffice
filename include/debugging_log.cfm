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
                        <div class="card card-body">
                            <!-- Parse and display JSON -->
                            <pre><cfoutput>#encodeForHTML(debugDetails)#</cfoutput></pre>
                        </div>
                    </div>
                </td>
                <td>#timestamp#</td>
            </tr>
        </cfoutput>
    </tbody>
</table>

<script>
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
