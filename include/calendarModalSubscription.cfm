<div id="subscription" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true"> 
    <div class="modal-dialog"> 
        <script src="https://ajax.googleapis.com/include/libs/jquery/1.11.1/jquery.min.js"></script> 
        <div class="modal-content"> 
            <div class="modal-header"> 
                <h4 class="modal-title" id="standard-modalLabel">Subscription URL</h4> 
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"> 
                    <i class="mdi mdi-close-thick"></i> 
                </button> 
            </div> 
            <div class="modal-body"> 
                <center> 
                    <!--- Output the subscription calendar URL --->
                    <h5 id="p1"><cfoutput>#calendarUrl#</cfoutput></h5> 
                </center> 
                <p>&nbsp;</p> 
            </div> 
        </div> 
    </div> 
</div>

<!--- Changes: Standardized variable names and casing (Rule 5). Removed unnecessary cfoutput tags around variable outputs (Rule 2). --->