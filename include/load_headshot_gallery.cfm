<cfparam name="audprojectid" default="">
<cfinclude template="/include/qry/headshots_sel_479_1.cfm" />

<div class="row">
    <cfloop query="headshots_sel">
        <cfoutput>
            <div class="col-md-3 col-sm-4 col-6">
                <div class="p-2 text-center">
                    <a href="javascript:void(0);" 
                       class="select-headshot" 
                       data-mediaid="#headshots_sel.mediaid#" 
                       data-audprojectid="#audprojectid#">
                        <img src="#session.userMediaUrl#/#headshots_sel.mediaFileName#" 
                             class="img-thumbnail img-fluid rounded" 
                             style="max-width: 100px; height: auto;" 
                             alt="#headshots_sel.medianame#">
                    </a>
                </div>
            </div>
        </cfoutput>
    </cfloop>
</div>
