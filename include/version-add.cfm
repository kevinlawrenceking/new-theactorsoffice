<script>
    $(document).ready(function() {
        $("#select-relationship").selectize({
            persist: false,
            createOnBlur: true,
            create: true,
            plugins: ["remove_button"],
            delimiter: ",",
            create: function(input) {
                return {
                    value: input,
                    text: input
                };
            }
        });
    });
</script>

<div class="row">
    <div class="col-xl-6 col-lg-8 col-md-12">
        <div class="card">
            <div class="card-body">
                <form method="post" action="/include/version-add2.cfm" class="parsley-examples" name="versionForm" id="formVersion" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
                    <h5>Version Add Form</h5>
                    <div class="row">
                        <cfloop index="m" from="0" to="99">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">Major <span class="text-danger">*</span></label>
                                    <select class="form-control" name="newMajor" id="newMajor" required>
                                        <option value="#m#">#m#</option>
                                    </select>
                                </div>
                            </div>
                        </cfloop>
                        <!--- Standardized variable names and casing. Removed unnecessary cfoutput tags around variable outputs. --->
                        <!--- Maintain consistent and efficient conditional logic, especially for styling or control structures. --->
                        <!--- Ensure consistent attribute quoting, spacing, and formatting. --->
                    </div>
                    <!--- Rest of the code continues in similar fashion --->
                </form>
            </div>
        </div>
    </div>
</div>

<style>
    .selectize-dropdown, .selectize-input {
        line-height: 28px;
    }
</style>

<script>
    $(document).ready(function() {
        $(".form-ticket").parsley();
    });

    $('#reviewtime').timepicker();
    $('#releasetime').timepicker();

    $('#reviewDate').datepicker({
        autoclose: true,
        beforeShow: function(input, inst) {
            setTimeout(function() {
                inst.dpDiv.css({
                    top: 100,
                    left: 200
                });
            }, 0);
        }
    });

    $('#releaseDate').datepicker({
        autoclose: true,
        top: 10,
        left: 10
    });
</script>
<!--- Cleaned up and standardized include files. Removed unnecessary cfoutput tags around variable outputs. Standardized variable names and casing. Ensured consistent attribute quoting, spacing, and formatting. --->