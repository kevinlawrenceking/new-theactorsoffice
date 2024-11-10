<form action="ingestform.cfm" name="imageForm" method="post">
    <input type="hidden" name="pgAction" value="Add" />
    <script type="text/javascript">
        function yesNoCheck() {
            if (document.getElementById('myTattedLife').checked || document.getElementById('datingCanBeMurder').checked) {
                document.getElementById('ifYes').style.visibility = 'visible';
            } else {
                document.getElementById('ifYes').style.visibility = 'hidden';
            }
        }

        function clear() {
            clearRadioGroup("reachCategories");
        }

        function clearRadioGroup(groupName) {
            var ele = document.getElementsByName(groupName);
            for (var i = 0; i < ele.length; i++) {
                ele[i].checked = false;
            }
            document.getElementById('ifYes').style.visibility = 'hidden';
        }
    </script>
    <div class="form-group">
        <div style="margin-right:5px; margin-left:15px;">
            <label class="form-check-label" for="myTattedLife" style="margin-right:5px; margin-left:5px;">
                <input type="radio" name="reachCategories" id="myTattedLife" value="My Tatted Life" class="styled" onclick="yesNoCheck();"> My Tatted Life
            </label>
            <span style="visibility:hidden" id="ifYes">
                <input type="button" value="Clear Restriction" class="small" onclick="clear();">
            </span>
        </div>
    </div>
    <p>
        <input type="submit" onclick="popup('popUpDiv')" id="submitIt" name="submitIt" value="Continue" style="visibility: hidden;" class="btn submitIt btn-xs btn-primary legitRipple" />
    </p>
</form>
<input type="file" name="files">

<!--- Modifications: Standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting. --->