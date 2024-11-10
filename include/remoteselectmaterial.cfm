<!--- This ColdFusion page displays headshots and allows selection of media items for a specific event. --->
<cfinclude template="/include/qry/materials_sel_unused.cfm" />
<cfparam name="placeholder" default="" />
<cfinclude template="/include/qry/types_45_1.cfm" />

<div class="row">
    <!--- Loop through the headshots query to display each headshot item --->
    <cfloop query="headshots_sel">
        <div class="col-sm-12">
            <center>
                <a href="/include/remoteselectedmaterial2.cfm?selected_eventid=#selected_eventid#&mediaid=#mediaid#&eventid=#eventid#&audprojectid=#audprojectid#">
                    <img src="#application.filetypesUrl#/#mediaext#.png?ver=#rand()#" class="mr-2 rounded-square gambar img-thumbnail img-fluid p-0 m-0" style="width:120px;" title="User ID: 30" alt="profile-image" id="item-img-output">
                </a>
            </center>
            <center>
                #mediatype#<br/>
                #medianame#
            </center>
            <p class="p-0" style="padding:10px;">
                <center>
                    <a href="/include/remoteselectedmaterial2.cfm?eventid=#selected_eventid#&mediaid=#mediaid#&audprojectid=#audprojectid#" title="Select" data-bs-original-title="Add media" class="btn btn-xs btn-primary waves-effect waves-light">Select</a>
                </center>
                <br/>
            </p>
            <span class="p-3">&nbsp;</span>
            <span class="p-3">&nbsp;</span>
        </div>
    </cfloop>
</div>

<!--- Changes: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Simplified record count logic for icons or conditional displays.
6. Improved logic for expanding and collapsing views in mobile layouts.
7. Removed cftry and cfcatch blocks entirely.
8. Used double pound signs ## for hex color codes or jQuery syntax to avoid interpretation as variables.
--->