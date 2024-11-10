<!--- This ColdFusion page handles the approval process for tickets, displaying relevant details and allowing users to update test status and rejection notes. --->
<cfinclude template="/include/qry/details_212_1.cfm" />
<cfinclude template="/include/qry/users_212_2.cfm" />
<cfinclude template="/include/qry/find_212_3.cfm" />

<!--- Check if a record is found in the find query --->
<cfif find.recordcount eq 1>
    <cfset testId = find.id />
    <cfset newTestStatus = find.teststatus />
    <cfset newRejectNotes = find.rejectNotes />
<cfelse>
    <cfset testId = 0 />
    <cfset newTestStatus = "" />
    <cfset newRejectNotes = "" />
</cfif>

<div class="row">
    <form class="px-3 col-md-12" id="approveForm#details.recid#" method="post" action="/include/remoteapprove2.cfm">
        <cfoutput query="details">
            <input type="hidden" name="oldVerId" value="#oldVerId#" />
            <input type="hidden" name="newTicketId" value="#recid#" />
            <input type="hidden" name="testId" value="#testId#" />
            <input type="hidden" name="newUserId" value="#users.newUserId#" />

            <div class="form-group col-md-12">
                <h5>Ticket No. #recid#</h5>
                <p>#ticketName#</p>
            </div>

            <div class="form-group col-md-12">
                <h5>Tested By</h5>
                <p>#users.userName#</p>
            </div>
        </cfoutput>

        <div class="form-group col-md-6">
            <label for="ticketType">Test Status</label>
            <select class="form-control" name="newTestStatus" id="newTestStatus" required>
                <option value="Approved" <cfif newTestStatus eq "Approved">selected</cfif>>Approved</option>
                <option value="Rejected" <cfif newTestStatus eq "Rejected">selected</cfif>>Rejected</option>
            </select>
        </div>

        <div class="form-group col-md-12">
            <label for="ticketType">If Rejected, state reason:</label>
            <textarea class="form-control" type="text" id="newRejectNotes" name="newRejectNotes" placeholder="Details" rows="2">#newRejectNotes#</textarea>
        </div>
    </form>

    <div class="row mt-2">
        <div class="col-6"></div>
        <div class="col-6 text-right">
            <a href="javascript:history.go(-1)">
                <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button>
            </a>
            <button onclick="form_submit()" type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Update</button>
        </div>
    </div>
</div>

<script type="text/javascript">
    function form_submit() {
        document.getElementById("approveForm##details.recid##").submit();
    }
</script>

<!--- Changes made:
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Simplified record count logic for icons or conditional displays.
4. Standardized variable names and casing.
5. Ensured consistent attribute quoting, spacing, and formatting.
6. Used double pound signs ## for non-variable # symbols inside cfoutput blocks.
--->