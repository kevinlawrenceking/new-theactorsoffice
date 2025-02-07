<cfparam name="audprojectid" default="">

<!--- Query to get latest headshots --->

<cfinclude template="/include/qry/headshots_377_2.cfm" />
<cfoutput>
    <pre>
        Debug: AudProjectID = #audprojectid#
        Query Record Count: #headshots.recordcount#
    </pre>
</cfoutput>
<!--- Return updated gallery --->
<div class="row">
    <cfloop query="headshots">
        <cfoutput>
            <div class="col-md-3 col-sm-4 col-6">
                <div class="p-2 text-center">
                    <a href="javascript:void(0);" class="select-headshot" 
                       data-mediaid="#headshots.mediaid#" 
                       data-audprojectid="#audprojectid#">
                        <img src="#session.userMediaUrl#/#headshots.mediaFileName#?ver=#rand()#" 
                             class="img-thumbnail img-fluid rounded" 
                             style="max-width: 100px; height: auto;" 
                             alt="#headshots.medianame#">
                    </a>
                </div>
            </div>
        </cfoutput>
    </cfloop>
</div>
