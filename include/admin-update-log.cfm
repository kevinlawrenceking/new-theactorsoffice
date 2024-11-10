<!--- This ColdFusion page displays an update log in a table format. --->
<cfparam name="focusID" default="" />
<cfparam name="curLink" default="" />
<cfparam name="start" default="start" />
<cfparam name="perPage" default="10" />
<cfparam name="selSearch" default="" />
<cfparam name="useSession" default="Y" />
<cfparam name="setSession" default="Y" />
<cfparam name="selSortBy" default="count_high" />

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Update Log</h4>
                <p class="text-muted font-13 mb-4"></p>
                <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped" role="grid">
                    <thead>
                        <!--- Output the header row for the table --->
                        <cfoutput query="results" maxrows="1">
                            <cfif (Results.CurrentRow MOD 2)>
                                <cfset rowType = "Odd" />
                            <cfelse>
                                <cfset rowType = "Even" />
                            </cfif>
                            <tr class="#rowType#">
                                <th>#head1#</th>
                                <th>#head2#</th>
                                <th>#head3#</th>
                                <th>#head4#</th>
                                <th>#head5#</th>
                                <th>#head6#</th>
                                <th>#head7#</th>
                            </tr>
                        </cfoutput>
                    </thead>

                    <tbody>
                        <!--- Output the data rows for the table --->
                        <cfoutput query="results">
                            <tr>
                                <td>#DateFormat(results.col1, "long")#</td>
                                <td>#TimeFormat(results.col2, "medium")#</td>
                                <td>#results.col3#</td>
                                <td>#results.col4#</td>
                                <td>#results.col5#</td>
                                <td>#results.col6#</td>
                                <td>#results.col7#</td>
                            </tr>
                        </cfoutput>
                    </tbody>
                </table>
            </div> <!--- end card body --->
        </div> <!--- end card --->
    </div><!--- end col --->
</div>

<!--- Changes made: 
1. Standardized variable names and casing.
2. Removed unnecessary `#` symbols within conditional checks.
3. Ensured consistent attribute quoting, spacing, and formatting.
4. Simplified date and time formatting across the code.
--->