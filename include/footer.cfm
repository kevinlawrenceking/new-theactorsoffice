<!--- This ColdFusion page displays a diagnostics modal and a footer with device information and links. --->
<div id="diagnostics" class="modal fade" tabindex="-1" role="dialog" >

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    <cfoutput>Diagnostics</cfoutput>
                </h4>
                <button type="button" class="close" data-bs-dismiss="modal" >

                    <i class="mdi mdi-close-thick"></i>
                </button>
            </div>
            <div class="modal-body">
                <cfoutput>
               <cfsavecontent variable="diagnostics">
    <!--- Check if pgid is defined and output its value --->
    <cfif #isdefined('pgid')#>
        pgid: #pgid#<br />
    </cfif>

    <!--- Check if ref_pgid is defined and output its value --->
    <cfif #isdefined('ref_pgid')#>
        ref_pgid: #ref_pgid#<br />
    </cfif>

    <!--- Check if userid is defined and output its value --->
    <cfif #isdefined('userid')#>
        userid: #userid#<br />
    </cfif>

    <!--- Check if cookie.uploadDir is defined and output its value --->
    <cfif #isdefined('cookie.uploadDir')#>
        cookie.uploadDir: #cookie.uploadDir#<br />
    </cfif>

    <!--- Check if cookie.return_url is defined and output its value --->
    <cfif #isdefined('cookie.return_url')#>
        cookie.return_url: #cookie.return_url#<br />
    </cfif>

    <!--- Check if browser_contact_avatar_loc is defined and output its value --->
    <cfif #isdefined('browser_contact_avatar_loc')#>
        browser_contact_avatar_loc: #browser_contact_avatar_loc#<br />
    </cfif>

    <!--- Check if image_url is defined and output its value --->
    <cfif #isdefined('image_url')#>
        image_url: #image_url#<br />
    </cfif>

    <!--- Check if appName is defined and output its value --->
    <cfif #isdefined('appName')#>
        appName: #appName#<br />
    </cfif>

    <!--- Check if appDescription is defined and output its value --->
    <cfif #isdefined('appDescription')#>
        appDescription: #appDescription#<br />
    </cfif>

    <!--- Check if appAuthor is defined and output its value --->
    <cfif #isdefined('appAuthor')#>
        appAuthor: #appAuthor#<br />
    </cfif>

    <!--- Check if appLogoName is defined and output its value --->
    <cfif #isdefined('appLogoName')#>
        appLogoName: #appLogoName#<br />
    </cfif>

    <!--- Check if colorTopBar is defined and output its value --->
    <cfif #isdefined('colorTopBar')#>
        colorTopBar: #colorTopBar#<br />
    </cfif>

    <!--- Check if colorLeftSideBar is defined and output its value --->
    <cfif #isdefined('colorLeftSideBar')#>
        colorLeftSideBar: #colorLeftSideBar#<br />
    </cfif>

    <!--- Check if home is defined and output its value --->
    <cfif #isdefined('home')#>
        home: #home#<br />
    </cfif>

    <!--- Check if mocktoday is defined and output its value --->
    <cfif #isdefined('mocktoday')#>
        mocktoday: #mocktoday#<br />
    </cfif>

    <!--- Check if mock_yn is defined and output its value --->
    <cfif #isdefined('mock_yn')#>
        mock_yn: #mock_yn#<br />
    </cfif>

    <!--- Check if compid is defined and output its value --->
    <cfif #isdefined('compid')#>
        compid: #compid#<br />
    </cfif>

    <!--- Check if compname is defined and output its value --->
    <cfif #isdefined('compname')#>
        compname: #compname#<br />
    </cfif>

    <!--- Check if compDir is defined and output its value --->
    <cfif #isdefined('compDir')#>
        compDir: #compDir#<br />
    </cfif>

    <!--- Check if compTable is defined and output its value --->
    <cfif #isdefined('compTable')#>
        compTable: #compTable#<br />
    </cfif>

    <!--- Check if compowner is defined and output its value --->
    <cfif #isdefined('compowner')#>
        compowner: #compowner#<br />
    </cfif>

    <!--- Check if cookie.pgid is defined and output its value --->
    <cfif #isdefined('cookie.pgid')#>
        cookie.pgid: #cookie.pgid#<br />
    </cfif>

    <!--- Check if pgname is defined and output its value --->
    <cfif #isdefined('pgname')#>
        pgname: #pgname#<br />
    </cfif>

    <!--- Check if pgDir is defined and output its value --->
    <cfif #isdefined('pgDir')#>
        pgDir: #pgDir#<br />
    </cfif>

    <!--- Check if pgTitle is defined and output its value --->
    <cfif #isdefined('pgTitle')#>
        pgTitle: #pgTitle#<br />
    </cfif>

    <!--- Check if pgHeading is defined and output its value --->
    <cfif #isdefined('pgHeading')#>
        pgHeading: #pgHeading#<br />
    </cfif>

    <!--- Check if pgFilename is defined and output its value --->
    <cfif #isdefined('pgFilename')#>
        pgFilename: #pgFilename#<br />
    </cfif>

    <!--- Check if update_type is defined and output its value --->
    <cfif #isdefined('update_type')#>
        update_type: #update_type#<br />
    </cfif>

    <!--- Check if pageTitle is defined and output its value --->
    <cfif #isdefined('pageTitle')#>
        pageTitle: #pageTitle#<br />
    </cfif>

    <!--- Check if currentURL is defined and output its value --->
    <cfif #isdefined('currentURL')#>
        currentURL: #currentURL#<br />
    </cfif>

    <!--- Check if host is defined and output its value --->
    <cfif #isdefined('host')#>
        host: #host#<br />
    </cfif>
</cfsavecontent>

                    <p>#diagnostics#</p>
                </cfoutput>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <cfoutput>
                    #devicetype# version. #this.formatDate('#now()#','YYYY')# 
                    <!--- Check if userid is "30" and if currentStartDate is defined, output the current date --->
                    <cfif #userid# is "30">
                        <cfif #isdefined('currentStartDate')#>
                            current date: #this.formatDate('#currentstartdate#')#
                        </cfif>
                    </cfif>
                </cfoutput>&reg; The Actor's Office LLC - All rights reserved
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
