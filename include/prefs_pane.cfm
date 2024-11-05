<!--- This ColdFusion page displays user preferences and settings, including calendar settings, newsletter options, and submission sites. --->

<h4>Preferences</h4>

<h5>
    Default Settings 
    <a title="Edit" href="" title="Update calendar settings" data-bs-toggle="modal" data-bs-target="#updatecal">
        <i class="mdi mdi-square-edit-outline"></i>
    </a>
</h5>

<div class="row" style="margin: auto;">
    <div class="col-md-2 p-2">
        <strong>Start time:</strong>
    </div>
    <div class="col-md-10 p-2">
        <cfoutput>
            <a href="" title="Start time for your Calendar Day" data-bs-toggle="modal" data-bs-target="##updatecal">#calstarttime#</a>
        </cfoutput>
    </div>

    <div class="col-md-2 p-2">
        <strong>End time:</strong>
    </div>
    <div class="col-md-10 p-2">
        <cfoutput>
            <a href="" title="End time for your Calendar Day" data-bs-toggle="modal" data-bs-target="##updatecal">#calendtime#</a>
        </cfoutput>
    </div>
</div>

<div class="row" style="margin: auto;">
    <div class="col-md-2 p-2">
        <strong>Rows Per Page:</strong>
    </div>
    <div class="col-md-10 p-2">
        <cfoutput>
            <a href="" title="Default Rows for Relationships Table" data-bs-toggle="modal" data-bs-target="##updatecal">#defRows#</a>
        </cfoutput>
    </div>

    <div class="col-md-2 p-2">
        <strong>Time Zone:</strong>
    </div>
    <div class="col-md-10 p-2">
        <cfoutput>
            <a href="" title="Default State for your Contacts" data-bs-toggle="modal" data-bs-target="##updatecal">#tzgeneral#</a>
        </cfoutput>
    </div>

    <div class="col-md-2 p-2">
        <strong>Date Format:</strong>
    </div>
    <div class="col-md-10 p-2">
        <cfoutput>
            <a href="" title="Date format" data-bs-toggle="modal" data-bs-target="##updatecal">#formatExample#</a>
        </cfoutput>
    </div>
</div>

<h5>
    My Newsletter
    <a href="" title="Update newsletter settings" data-bs-toggle="modal" data-bs-target="#updatenewsletter">
        <i class="mdi mdi-square-edit-outline"></i>
    </a>
</h5>

<div class="row" style="margin: auto;">
    <div class="col-md-2 p-2">
        <strong>Newsletter?</strong>
    </div>
    <div class="col-md-10 p-2">
        <a href="" title="Update newsletter settings" data-bs-toggle="modal" data-bs-target="#updatenewsletter">
            <cfif nletter_yn is "Y">Yes
            <cfelse>No</cfif>
        </a>
    </div>
</div>

    <div class="col-md-2 p-2">
        <strong>Newsletter Link</strong>
    </div>
    <div class="col-md-10 p-2">
        <cfif #nletter_yn# is "Y">
            <cfif #nletter_link# is not "">
                <cfif #left('#nletter_link#','4')# is "http">
                    <cfoutput>
                        <cfset new_nletter_link="#nletter_link#" />
                    </cfoutput>
                </cfif>
                <cfif #left('#nletter_link#','4')# is not "http">
                    <cfoutput>
                        <cfset new_nletter_link="http://#nletter_link#" />
                    </cfoutput>
                </cfif>
                <cfoutput>
                    <A HREF="#new_nletter_link#" target="external">#nletter_link#</A>
                </cfoutput>
            </cfif>
            <cfif #nletter_link# is "">
                <i>Please add your newsletter link.</i>
            </cfif>
        </cfif>
    </div>
</div>

<cfinclude template="/include/qry/subsites_189_1.cfm" />


</div>
<div class="d-flex justify-content-between">
    <div class="float-left">
        <h5>My Submission Sites</h5>
    </div>

    <cfoutput>
        <script>
            $(document).ready(function() {
                $("##remoteaddaudsubmitsite").on("show.bs.modal", function(event) {
                    // Place the returned HTML into the selected element
                    $(this).find(".modal-body").load("/include/remoteaddaudsubmitsite.cfm?userid=#userid#");
                });
            });
        </script>
    </cfoutput>

    <cfset modalid="remoteaddaudsubmitsite" />
    <cfset modaltitle="Add Submission Site" />
    <cfinclude template="/include/modal.cfm" />

    <div class="float-end">
        <a href="" data-bs-remote="true" data-bs-toggle="modal" 
           data-bs-target="#remoteaddaudsubmitsite" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" 
           style="background-color: #406e8e; border: #406e8e;">
            Add
        </a>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <cfloop query="subsites">
            <div class="col-md-2 col-lg-3 col-sm-12"> 
                <cfoutput>                         
                    <script>
                        $(document).ready(function() {
                            $("##remoteUpdateaudsubmitsite_#subsites.submitsiteid#").on("show.bs.modal", function(event) {
                                // Place the returned HTML into the selected element
                                $(this).find(".modal-body").load("/include/remoteUpdateaudsubmitsite.cfm?userid=#userid#&src=account&submitsiteid=#subsites.submitsiteid#");
                            });
                        });
                    </script>

                    <cfset modalid="remoteUpdateaudsubmitsite_#subsites.submitsiteid#" />
                    <cfset modaltitle="Update Submission Site" />
                    <cfinclude template="/include/modal.cfm" />

                    <p class="p-2">
                        <a href="" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateaudsubmitsite_#subsites.submitsiteid#"> 
                            <button type="button" class="btn btn-soft-secondary rounded-pill waves-effect">#subsites.submitsitename#</button> 
                        </a>
                    </p>              
                </cfoutput>
                <br>
            </div>
        </cfloop>
    </div>
</div>
