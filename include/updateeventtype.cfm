<!--- This ColdFusion page is used to update event type details including name and color. --->
<cfinclude template="/include/qry/linkdetails_309_1.cfm" />
<cfinclude template="/include/qry/find_events_309_2.cfm" />

<form action="/include/updateeventtypeupdate.cfm" method="post" class="needs-validation" validate id="profile-form">
    <input type="hidden" name="id" value="#linkdetails.id#">
    <input type="hidden" name="new_iscustom" value="#linkdetails.iscustom#">

    <div class="row">
        <!--- Check if the event is not custom --->
        <cfif linkdetails.iscustom EQ 0>
            <input type="hidden" name="new_eventtypename" value="#linkdetails.eventtypename#">
            <div class="form-group col-md-6">
                <h5>
                    <span class="fc-event-dot" style="background-color:##linkdetails.eventtypecolor##"></span>&nbsp; #linkdetails.eventtypename#
                </h5>
            </div>
        <!--- If the event is custom, show input for event name --->
        <cfelse>
            <div class="form-group col-md-12">
                <label for="new_eventtypename">Name:</label>
                <input class="form-control" type="text" id="new_eventtypename" name="new_eventtypename" value="#linkdetails.eventtypename#" required placeholder="Enter an Event Type">
                <div class="invalid-feedback"> Please enter your Event Type. </div>
            </div>
        </cfif>

        <div class="form-group col-md-12">
            <label for="hexa-colorpicker">Color:</label>
            <input type="text" id="hexa-colorpicker_#id#" name="new_eventtypecolor" class="form-control" value="#linkdetails.eventtypecolor#">
            <div class="invalid-feedback"> Please enter a color. </div>
        </div>

        <!--- Check if the event is custom and has no associated events --->
        <cfif linkdetails.isCustom EQ 1 AND find_events.recordcount EQ 0>
            <div class="form-group col-md-12">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="deletelink" value="1" name="deletelink">
                    <label class="custom-control-label" for="deletelink">Remove</label>
                </div>
            </div>
        </cfif>

        <div class="form-group col-md-12">
            <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: ##406e8e; border: ##406e8e;">Update</button>
        </div>
    </div>
</form>

<script>
    $(function () {
        $('#hexa-colorpicker_#linkdetails.id#').colorpicker();
    });
</script>

<!--- Changes made based on standards: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Simplified record count logic for icons or conditional displays.
4. Standardized variable names and casing.
5. Used double pound signs for hex color codes to avoid interpretation as variables.
--->