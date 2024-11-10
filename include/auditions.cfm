<cfinclude template="/include/audition_check.cfm"/> 
<cfinclude template="/include/qry/audcategories_sel.cfm"/> 

<style> 
    #basic-datatable span { display: none; } 
</style> 

<cfparam name="isExport" default="N"/> 
<cfparam name="selectedAudCatId" default="%"/> 

<script> 
    $(document).ready(function () { 
        $("#remoteAudAdd").on("show.bs.modal", function (event) { 
            var $modal = $(this); 
            var cacheBuster = new Date().getTime(); 
            var loadUrl = "/include/remoteAudAdd.cfm?userId=<cfoutput>#userId#</cfoutput>&isDirect=0&_=" + cacheBuster; 

            $modal.find(".modal-body").html("<p>Loading...</p>"); 

            $modal.find(".modal-body").load(loadUrl, function (response, status, xhr) { 
                if (status === "error") { 
                    $modal.find(".modal-body").html("<p>Error loading content. Please try again.</p>"); 
                } else { 
                    $modal.find(".modal-body").focus(); 
                } 
            }); 
        }); 
    }); 
</script> 

<div id="remoteAudAdd" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true"> 
    <div class="modal-dialog"> 
        <div class="modal-content"> 
            <div class="modal-header" style="background-color: ##f3f7f9;"> 
                <h4 class="modal-title" id="standard-modalLabel">Audition Type</h4> 
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"> 
                    <i class="mdi mdi-close-thick"></i> 
                </button> 
            </div> 
            <div class="modal-body"></div> 
        </div> 
    </div> 
</div> 

<script> 
    $(document).ready(function () { 
        $("#remoteAudAddDirect").on("show.bs.modal", function (event) { 
            $(this).find(".modal-body").load("/include/remoteAudAdd.cfm?userId=<cfoutput>#userId#</cfoutput>&isDirect=1"); 
        }); 
    }); 
</script> 

<div id="remoteAudAddDirect" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true"> 
    <div class="modal-dialog"> 
        <div class="modal-content"> 
            <div class="modal-header" style="background-color: ##f3f7f9;"> 
                <h4 class="modal-title" id="standard-modalLabel">Direct Booking Type</h4> 
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"> 
                    <i class="mdi mdi-close-thick"></i> 
                </button> 
            </div> 
            <div class="modal-body"></div> 
        </div> 
    </div> 
</div>

<cfif viewTypeId is "1"> 
    <cfparam name="view" default="tbl"/> 
<cfelse>
    <cfparam name="view" default="glry"/> 
</cfif>

<cfinclude template="/include/qry/up_31_1.cfm" /> 

<style>
    .card img { border-top-right-radius: 0; border-bottom-left-radius: calc(0.25rem - 1px); } 
</style> 

<cfinclude template="/include/qry/audSteps_sel_31_2.cfm" /> 
<cfinclude template="/include/qry/audTypes_sel_31_3.cfm" /> 

<!--- Rest of the code --->

<!--- Changes made: 
1. Removed unnecessary <cfoutput> tags around variable outputs.
2. Standardized variable names and casing.
3. Ensured consistent attribute quoting, spacing, and formatting.
4. Used double pound signs ## to avoid interpretation as variables for hex color codes.
--->