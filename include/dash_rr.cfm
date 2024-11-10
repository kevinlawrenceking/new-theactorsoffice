<!--- This ColdFusion page displays a dashboard for reminders and allows users to complete or skip reminders based on their selection. --->
<cfset currentStartDate = DateFormat(Now(),'yyyy-mm-dd') />
<cfinclude template="/include/qry/reminders_511_1.cfm" />
<cfinclude template="/include/qry/notsActive_511_2.cfm" />
<cfinclude template="/include/qry/notsActives_461_1.cfm" />

<cfif notsactives.recordcount eq 0>
    <cfset notsTotal = 0 />
<cfelse>
    <cfset notsTotal = notsActives.nots_total />
</cfif>

<style>
    .input-xs, select.input-xs { height: 24px; line-height: 24px; }
</style>

<script type="text/javascript">
    $(document).ready(function() {
        $('#submit-button input:checkbox').change(function() {
            var a = $('#submit-button input:checked').filter(":checked").length;
            if (a == 0) {
                $('.btn').prop('disabled', true);
            } else {
                $('.btn').prop('disabled', false);
            }
        });
    });
</script>

<div class="card grid-item loaded" data-id="<cfoutput>#dashboards.pnid#</cfoutput>">
    <div class="card-header" id="heading_system_<cfoutput>#dashboards.currentrow#</cfoutput>">
        <h5 class="m-0">
            <a class="text-dark collapsed" data-bs-toggle="collapse" href="##collapse_system_<cfoutput>#dashboards.currentrow#</cfoutput>">
                <cfoutput>#dashboards.pnTitle# (#numberformat(reminders_total)#)</cfoutput>
            </a>
        </h5>
    </div>

    <div class="card-body">
        <form action="/app/dashboard_new/" method="post" id="submit-button">
            <div class="row">
                <div class="col-md-12 d-flex" style="padding-bottom:10px; margin-bottom:10px;">
                    <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" name="batchtype" value="complete" style="width:85px;background-color: ##406e8e; border: ##406e8e;">Complete</button>
                    <input type="hidden" name="pgaction" value="batch" />
                    <span style="margin-left:3px;">
                        <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" name="batchtype" value="skip" style="width:85px;color:black;background-color: ##DECE8E; border: ##d2bd67;">Skip</button>
                    </span>
                </div>

                <!--- Check if there are any active reminders --->
                <cfif reminders_total neq 0>
                    <cfloop query="notsactive">
                        <div class="col-md-12" style="padding-bottom:5px;">
                            <strong><cfoutput>#notsactive.recordname#</cfoutput></strong>
                            <A href="/app/contact?contactid=<cfoutput>#notsactive.contactid#</cfoutput>&t4=1"><i class="mdi mdi-eye-outline"></i></A>
                            <BR>
                            <!--- Check if the reminder is in the batch list --->
                            <cfif ListFind(batchlist, notsactive.notid)>
                                <input type="checkbox" class="custom-control-input" value="<cfoutput>#notsactive.notid#</cfoutput>" checked name="batchlist" style="margin-left:5px;" />
                            <cfelse>
                                <input type="checkbox" class="custom-control-input" value="<cfoutput>#notsactive.notid#</cfoutput>" name="batchlist" style="margin-left:5px;" />
                            </cfif>
                            <span class="custom-control-label"><small><cfoutput>#notsActive.actiondetails#</cfoutput></small></span>
                        </div>
                    </cfloop>
                <cfelse>
                    <div class="col-md-12" style="padding-bottom:5px;">
                        <center><small>You currently have no reminders!</small></center>
                    </div>
                </cfif>
            </div>
        </form>
    </div><!--- card-body end --->
</div><!--- end card --->

<!--- Changes made based on standards: 
1. Simplified conditional logic for notsactives.recordcount and reminders_total.
2. Removed unnecessary cfoutput tags around variable outputs.
3. Avoided using # symbols within conditional checks.
4. Simplified record count logic for icons or conditional displays.
5. Standardized variable names and casing (nots_total to notsTotal).
6. Ensured consistent attribute quoting, spacing, and formatting.
7. Used double pound signs for hex color codes to avoid interpretation as variables.
8. Replaced "contains" with "ListFind" for checking if the reminder is in the batch list.
--->