<h4>Preferences</h4>
<h5>Default Settings <a title="Edit" href="" title="Update calendar settings" data-bs-toggle="modal" data-bs-target="#updatecal"><i class="mdi mdi-square-edit-outline"></i></a></h5>
<div class="row" style="margin: auto;">
    <div class="col-md-2 p-2"><strong>Start time:</strong></div>
    <div class="col-md-10 p-2"><a href="" title="Start time for your Calendar Day" data-bs-toggle="modal" data-bs-target="##updatecal">calStartTime</a></div>
    <div class="col-md-2 p-2"><strong>End time:</strong></div>
    <div class="col-md-10 p-2"><a href="" title="End time for your Calendar Day" data-bs-toggle="modal" data-bs-target="##updatecal">calEndTime</a></div>
</div>
<div class="row" style="margin: auto;">
    <div class="col-md-2 p-2"><strong>Rows Per Page:</strong></div>
    <div class="col-md-10 p-2"><a href="" title="Default Rows for Relationships Table" data-bs-toggle="modal" data-bs-target="##updatecal">defRows</a></div>
    <div class="col-md-2 p-2"><strong>Time Zone:</strong></div>
    <div class="col-md-10 p-2"><a href="" title="Default State for your Contacts" data-bs-toggle="modal" data-bs-target="##updatecal">tzGeneral</a></div>
    <div class="col-md-2 p-2"><strong>Date Format:</strong></div>
    <div class="col-md-10 p-2"><a href="" title="Date format" data-bs-toggle="modal" data-bs-target="##updatecal">formatExample</a></div>
</div>
<h5>My Newsletter <a href="" title="Update newsletter settings" data-bs-toggle="modal" data-bs-target="#updatenewsletter"><i class="mdi mdi-square-edit-outline"></i></a></h5>
<div class="row" style="margin: auto;">
    <div class="col-md-2 p-2"><strong>Newsletter?</strong></div>
    <div class="col-md-10 p-2">
        <a href="" title="Update newsletter settings" data-bs-toggle="modal" data-bs-target="#updatenewsletter">
            <cfif nletterYN is "Y">Yes<cfelse>No</cfif>
        </a>
    </div>
</div>
<div class="col-md-2 p-2"><strong>Newsletter Link</strong></div>
<div class="col-md-10 p-2">
    <cfif nletterYN is "Y">
        <cfif nletterLink is not "">
            <cfif left(nletterLink, 4) is "http">
                <cfset newNletterLink = nletterLink />
            </cfif>
            <cfif left(nletterLink, 4) is not "http">
                <cfset newNletterLink = "http://" & nletterLink />
            </cfif>
            <A HREF="#newNletterLink#" target="external">#nletterLink#</A>
        </cfif>
        <cfif nletterLink is "">
            <i>Please add your newsletter link.</i>
        </cfif>
    </cfif>
</div>

<cfinclude template="/include/qry/subsites_189_1.cfm" />

<div class="d-flex justify-content-between">
    <div class="float-left">
        <h5>My Submission Sites</h5>
    </div>
    <script>
        $(document).ready(function() {
            $("##remoteAddAudSubmitSite").on("show.bs.modal", function(event) {
                $(this).find(".modal-body").load("/include/remoteAddAudSubmitSite.cfm?userid=userId");
            });
        });
    </script>
    <cfset modalId = "remoteAddAudSubmitSite" />
    <cfset modalTitle = "Add Submission Site" />
    <cfinclude template="/include/modal.cfm" />
    <div class="float-end">
        <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddAudSubmitSite" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e;">Add</a>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <cfloop query="subSites">
            <div class="col-md-2 col-lg-3 col-sm-12">
                <script>
                    $(document).ready(function() {
                        $("##remoteUpdateAudSubmitSite_#subSites.submitSiteId#").on("show.bs.modal", function(event) {
                            $(this).find(".modal-body").load("/include/remoteUpdateAudSubmitSite.cfm?userid=userId&src=account&submitSiteId=#subSites.submitSiteId#");
                        });
                    });
                </script>
                <cfset modalId = "remoteUpdateAudSubmitSite_#subSites.submitSiteId#" />
                <cfset modalTitle = "Update Submission Site" />
                <cfinclude template="/include/modal.cfm" />
                <p class="p-2">
                    <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateAudSubmitSite_#subSites.submitSiteId#">
                        <button type="button" class="btn btn-soft-secondary rounded-pill waves-effect">#subSites.submitSiteName#</button>
                    </a>
                </p>
                <br>
            </div>
        </cfloop>
    </div>
</div>

<!--- Changes made: Removed unnecessary cfoutput tags, standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting, removed cftry and cfcatch blocks, used double pound signs for non-variable uses in cfoutput blocks. --->