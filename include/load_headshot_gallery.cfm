<cfinclude template="/include/qry/audmedia.cfm" />


<h2>headshots here<cfoutput>audprojectid: #audprojectid#<BR>#headshots.recordcount#</cfoutput></h2>
    <div class="row">
        <cfloop query="headshots"><Cfoutput>
            <div class="col-md-3 col-sm-4 col-6">
                <div class="p-2 text-center">
                    <a href="javascript:void(0);" class="select-headshot" data-mediaid="#headshots.mediaid#">
                        <img src="#session.userMediaUrl#/#headshots.mediaFileName#" 
                             class="img-thumbnail img-fluid rounded" 
                             style="max-width: 100px; height: auto;" 
                             alt="#headshots.medianame#">
                    </a>
                </div>
            </div>
      </cfoutput> </cfloop>
    </div>

