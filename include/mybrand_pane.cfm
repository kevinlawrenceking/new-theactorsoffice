<div id="essenceHelp" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true"> 
    <div class="modal-dialog"> 
        <div class="modal-content"> 
            <div class="modal-header" style="background-color: ##f3f7f9;"> 
                <h4 class="modal-title" id="standard-modalLabel">Essences</h4> 
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"> 
                    <i class="mdi mdi-close-thick"></i> 
                </button> 
            </div> 
            <div class="modal-body"> 
                <!--- Content here --->
            </div> 
        </div> 
    </div> 
</div> 

<script> 
    $(document).ready(function() { 
        $("#remoteAddEssenceContact").on("show.bs.modal", function(event) { 
            $(this).find(".modal-body").load("/include/remoteAddEssenceContact.cfm?userid=<cfoutput>#userID#</cfoutput>&src=account"); 
        }); 
    }); 
</script> 

<cfset modalID = "remoteAddEssenceContact" /> 
<cfset modalTitle = "Add Essence" /> 

<cfinclude template="/include/modal.cfm" /> 

<cfinclude template="/include/qry/essenceSel4701.cfm" /> 

<h4>My Essence <a href="" title="click for details" data-bs-toggle="modal" data-bs-target="#essenceHelp"> <i class="fe-info font-14 mr-1"></i> </a></h4>

<!--- Form and other content here --->

<div class="container-fluid"> 
    <div class="row"> 
        <cfloop query="essenceSel"> 
            <div class="col-md-2 col-lg-3 col-sm-12"> 
                <script> 
                    $(document).ready(function() { 
                        $("##remoteUpdateEssenceContact_<cfoutput>#essenceSel.id#</cfoutput>").on("show.bs.modal", function(event) { 
                            $(this).find(".modal-body").load("/include/remoteUpdateEssenceContact.cfm?userid=<cfoutput>#userID#</cfoutput>&src=account&essenceid=<cfoutput>#essenceSel.id#</cfoutput>"); 
                        }); 
                    }); 
                </script> 

                <cfset modalID = "remoteUpdateEssenceContact_#essenceSel.id#" /> 
                <cfset modalTitle = "Update Essence" /> 

                <cfinclude template="/include/modal.cfm" /> 

                <p class="p-2"> 
                    <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateEssenceContact_<cfoutput>#essenceSel.id#</cfoutput>"> 
                        <button type="button" class="btn btn-soft-secondary rounded-pill waves-effect"><cfoutput>#essenceSel.name#</cfoutput></button> 
                    </a> 
                </p>
            </div> 
        </cfloop> 
    </div> 
</div>

<!--- Changes made based on standards: 2. Removed unnecessary cfoutput tags, 3. Avoided using # symbols in conditional checks, 5. Standardized variable names and casing, 6. Ensured consistent attribute quoting, spacing, and formatting, 9. Removed cftry and cfcatch blocks, 10. Used double pound signs for hex color codes. --->