<script>
    $(document).ready(function() {
        <!--- Initialize modal event for adding event type --->
        $("#addeventtype").on("show.bs.modal", function(event) {
            <!--- Load the HTML content into the modal body when it is shown --->
            $(this).find(".modal-body").load("/include/addeventtype.cfm");
        });
    });
</script>

<div id="addeventtype" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="standard-modalLabel">New Custom Appointment Type</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<!--- Changes: No changes were made as the provided code already adheres to the specified standards. --->