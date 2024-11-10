<!--- This ColdFusion page handles the display and management of media materials for auditions, including modals for selecting and adding materials. ---> 
<cfinclude template="/include/qry/audmedia_materials.cfm" /> 
<cfinclude template="/include/qry/audmedia_picklist.cfm" /> 
<cfinclude template="/include/qry/types_45_1.cfm" /> 
<cfinclude template="/include/qry/audlinks_44_2.cfm" /> 

<cfset modalId="remoteselectheadshot" /> 
<cfset modalTitle="Select a Headshot" /> 
<cfinclude template="/include/modal.cfm" /> 

<cfset modalId="remoteselectmaterial" /> 
<cfset modalTitle="Select Material" /> 
<cfinclude template="/include/modal.cfm" /> 

<!--- Removed unnecessary cfoutput tags around variable outputs, standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting --->

<div id="linkmediahelp" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true"> 
    <div class="modal-dialog"> 
        <div class="modal-content"> 
            <div class="modal-header" style="background-color: ##f3f7f9;"> 
                <h4 class="modal-title" id="standard-modalLabel">Link Media</h4> 
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"> 
                    <i class="mdi mdi-close-thick"></i> 
                </button> 
            </div> 
            <div class="modal-body"> 
                <p>There are times when you submit your own monologues, songs, or sides as your audition.</p> 
                <p>To add materials in your repertoire to TAO, go to My Account and then Materials.</p> 
                <p>Once added, they will appear in this list so you can easily add them to any of your auditions.</p> 
            </div> 
        </div> 
    </div> 
</div>

<cfoutput>
<script>
$(document).ready(function() {
    $("##remoteselectheadshot").on("show.bs.modal", function(event) {
        $(this).find(".modal-body").load("/include/remoteselectheadshot.cfm?selected_eventid=" + eventid + "&eventid=" + eventid + "&audprojectid=" + audprojectid + "&secid=177");
    });
    $("##remoteselectmaterial").on("show.bs.modal", function(event) {
        $(this).find(".modal-body").load("/include/remoteselectmaterial.cfm?selected_eventid=" + eventid + "&eventid=" + eventid + "&audprojectid=" + audprojectid + "&secid=177");
    });
    $("##remoteadd").on("show.bs.modal", function(event) {
        $(this).find(".modal-body").load("/include/remotaudmatadd.cfm?eventid=" + eventid + "&audprojectid=" + audprojectid + "&secid=177&new_isshare=0");
    });
});
</script>
</cfoutput>

<!--- Removed unnecessary cfoutput tags around variable outputs, standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting --->

<div id="remoteadd" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true"> 
    <div class="modal-dialog"> 
        <div class="modal-content"> 
            <div class="modal-header" style="background-color: ##f3f7f9;"> 
                <h4 class="modal-title" id="standard-modalLabel">Add Media</h4> 
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"> 
                    <i class="mdi mdi-close-thick"></i> 
                </button> 
            </div> 
            <div class="modal-body"> </div> 
        </div> 
    </div> 
</div>

<cfoutput>
<script>
$(document).ready(function() {
    $("##matupdate").on("show.bs.modal", function(event) {
        $(this).find(".modal-body").load("/include/audlinkadd.cfm?audroleid=" + audroleid + "&eventid=" + eventid + "&audprojectid=" + audprojectid + "&pgdir=audition");
    });
});
</script>
</cfoutput>

<!--- Removed unnecessary cfoutput tags around variable outputs, standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting --->

<div id="matupdate" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" aria-hidden="true"> 
    <div class="modal-dialog"> 
        <div class="modal-content"> 
            <div class="modal-header" style="background-color: ##f3f7f9;"> 
                <h4 class="modal-title" id="standard-modalLabel">Add Link</h4> 
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"> 
                    <i class="mdi mdi-close-thick"></i> 
                </button> 
            </div> 
            <div class="modal-body"> </div> 
        </div> 
    </div> 
</div>

<cfoutput>
<h4 class="p-1 d-flex">Materials Submitted 
    <span class="ms-auto text-muted"> 
        <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##matupdate" data-bs-placement="top" title="Update Materials" data-bs-original-title="Update Materials"> </a> 
    </span> 
</h4>
</cfoutput>

<cfset i=0 />

<cfoutput>
<script>
$(document).ready(function() {
    $("##remoteaddMaterial").on("show.bs.modal", function(event) {
        $(this).find(".modal-body").load("/include/remoteaddMaterial.cfm?userid=" + userid + "&src=aud&audprojectid=" + audprojectid + "&new_isshare=0");
    });
});
</script>
</cfoutput>

<cfset modalId = "remoteaddMaterial"/> 
<cfset modalTitle = "Add Material"/> 
<cfinclude template="/include/modal.cfm"/> 

<form action="/include/linkmedia.cfm"> 
    <input type="hidden" name="audprojectid" value="#audprojectid#" /> 
    <select id="new_mediaid" name="new_mediaid" onchange="this.form.submit()"> 
        <option value="">Link Material</option> 
        <cfoutput query="audmedia_picklist"> 
            <option value="#audmedia_picklist.mediaid#">#audmedia_picklist.mediatype#: #audmedia_picklist.medianame#</option> 
        </cfoutput> 
    </select> 
    <a href="" title="click for details" data-bs-toggle="modal" data-bs-target="#linkmediahelp"> 
        <i class="fe-info font-14 mr-1"></i> 
    </a> 
</form> 

<cfoutput>
<div style="padding:10px;"> 
    <a data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteaddMaterial" data-bs-placement="top" title="Add media" data-bs-original-title="Add material" class="btn btn-xs btn-primary waves-effect waves-light"> Add Material </a> 
</div>
</cfoutput>

<div class="row pt-3 pb-3"> 
    <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped" role="grid"> 
        <thead> 
            <tr class="#rowtype#"> 
                <th width="50">Action</th> 
                <th>Type</th> 
                <th>Name</th> 
                <th>Filename</th> 
                <th>URL</th> 
                <th>Created</th> 
            </tr> 
        </thead> 
        <tbody> 

<!--- Simplified record count logic for icons or conditional displays, standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting --->

<cfloop query="audmedia"> 

<cfoutput>
<script>
$(document).ready(function() {
    $("##remoteDeleteaudmedia#audmedia.mediaid#").on("show.bs.modal", function(event) {
        $(this).find(".modal-body").load("/include/remoteDeleteaudmedia.cfm?mediaid=" + audmedia.mediaid + "&secid=177");
    });
    $("##remoteRemoveaudmedia#audmedia.mediaid#").on("show.bs.modal", function(event) {
        $(this).find(".modal-body").load("/include/remoteRemoveaudmedia.cfm?mediaid=" + audmedia.mediaid + "&audprojectid=" + audprojectid + "&secid=196");
    });
    $("##remoteupdatematerial#audmedia.mediaid#").on("show.bs.modal", function(event) {
        $(this).find(".modal-body").load("/include/remoteupdatematerial.cfm?mediaid=" + audmedia.mediaid + "&src=aud&dir=aud&aud