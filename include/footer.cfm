<div id="diagnostics" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Diagnostics</h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">
                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body">
                <cfsavecontent variable="diagnosticsContent">
                    <cfif isDefined('pgid')>
                        pgid: #pgid#<br />
                    </cfif>
                    <cfif isDefined('ref_pgid')>
                        ref_pgid: #ref_pgid#<br />
                    </cfif>
                    <cfif isDefined('userid')>
                        userid: #userid#<br />
                    </cfif>
                    <cfif isDefined('cookie.uploadDir')>
                        cookie.uploadDir: #cookie.uploadDir#<br />
                    </cfif>
                    <cfif isDefined('cookie.return_url')>
                        cookie.return_url: #cookie.return_url#<br />
                    </cfif>
                    <cfif isDefined('browser_contact_avatar_loc')>
                        browser_contact_avatar_loc: #browser_contact_avatar_loc#<br />
                    </cfif>
                    <cfif isDefined('image_url')>
                        image_url: #image_url#<br />
                    </cfif>
                </cfsavecontent>
                <p>#diagnosticsContent#</p> 
            </div> 
        </div> 
    </div> 
</div> 

<footer class="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                #deviceType# version. #dateFormat(now(),'YYYY')#
                <cfif session.userid is "30" and isDefined('currentStartDate')>
                    current date: #dateFormat(currentStartDate)# 
                </cfif>
                &reg; The Actor's Office LLC - All rights reserved 
            </div>
            <div class="col-md-6">
                <div class="text-md-end footer-links d-none d-sm-block">
                    <a href="https://www.theactorsoffice.com" target="_blank">TAO Website</a>
                    <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#diagnostics" data-bs-placement="top" title="Diagnostics">Diagnostics</a>
                </div>
            </div>
        </div> 
    </div> 
</footer>

<!--- Changes: Removed unnecessary `<cfoutput>` tags around variable outputs (Standard 2). Removed `#` symbols within conditional checks (Standard 3). Standardized variable names and casing (Standard 5). Ensured consistent attribute quoting, spacing, and formatting (Standard 6). Used uniform date and time formatting across the code (Standard 7). --->