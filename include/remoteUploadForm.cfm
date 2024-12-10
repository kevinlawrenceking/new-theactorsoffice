<!--- This ColdFusion page handles an image submission form with radio button selections and visibility toggling for additional options. --->

<form action="ingestform.cfm" name="Image_Form" method="post">
    <input type="hidden" name="pg_action" value="Add" />

    <!--- JavaScript function to check radio button selection and toggle visibility of additional options. --->
    <script type="text/javascript">
        function yesnoCheck() {
            if (document.getElementById('MyTattedLife').checked || document.getElementById('DatingCanBeMurder').checked) {
                document.getElementById('ifYes').style.visibility = 'visible';
            } else {
                document.getElementById('ifYes').style.visibility = 'hidden';
            }
        }
    </script>

    <!--- JavaScript functions to clear radio button selections and hide additional options. --->
    <script>
        function Clear() {
            clearRadioGroup("Reach_Categories");
        }

        function clearRadioGroup(GroupName) {
            var ele = document.getElementsByName(GroupName);
            for (var i = 0; i < ele.length; i++) {
                ele[i].checked = false;
            }
            document.getElementById('ifYes').style.visibility = 'hidden';
        }
    </script>

    <div class="form-group">
        <div style="margin-right:5px; margin-left:15px;">
            <!--- Radio button for "My Tatted Life" category selection. --->
            <label class="form-check-label" for="My Tatted Life" style="margin-right:5px; margin-left:5px;">
                <input type="radio" name="Reach_Categories" id="MyTattedLife" value="My Tatted Life" class="styled" onclick="javascript:yesnoCheck();" />
                My Tatted Life
            </label>

            <!--- Additional options that appear based on radio button selection. --->
            <span style="visibility:hidden" id="ifYes">
                <input type="button" value="Clear Restriction" class="small" onclick="Clear();" />
            </span>
        </div>
    </div>

    <p>
        <!--- Submit button to continue with the form submission. --->
        <input type="submit" onclick="popup('popUpDiv')" id="submitit" name="submitit" value="Continue" style="visibility: hidden;" class="btn submitit btn-xs btn-primary legitRipple" />
    </p>
</form>

<!--- File input for uploading files. --->
<input type="file" name="files" />
