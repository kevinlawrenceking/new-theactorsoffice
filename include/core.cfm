 


<cfparam name="devicetype" default="Unknown" />


    <cfset devicetype="Desktop" />


<!DOCTYPE html>

<cfinclude template="/include/pgload.cfm" />
<cfinclude template="/include/qry/menuitems.cfm">
<cfinclude template="/include/qry/mennuItemsA_496_2.cfm">

<html lang="en">
<head>
    <cfoutput>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>#appName# | #pgTitle#</title>
        <meta content="#appDescription#" name="description" />
        <meta content="#appAuthor#" name="author" />
        <meta name="robots" content="noindex">
    </cfoutput>

    <cfoutput>
        #pagelinks.top_links#
    </cfoutput>

    <style>
        body.authentication-bg {
            background-color: <cfoutput>#hostcolor#</cfoutput>;
            background-size: cover;
            background-position: center;
        }
        .navbar-custom {
            background-color: <cfoutput>#hostcolor#</cfoutput>;
        }
    </style>
</head>

<body style="overflow-y: scroll!important;">
    <div id="wrapper">
        <cfinclude template="/include/topbar.cfm" />
        <cfinclude template="/include/leftbar.cfm" />

        <div class="content-page">
            <div class="content">
                <!-- Start Content -->
                <div class="container-fluid">
                    <!-- Start Page Title -->
                    <div class="row">
                        <cfif #pgid# is "17599999">
                            <cfinclude template="/include/core_title_175.cfm" />
                        <CFELSE>
                            <cfinclude template="/include/core_title.cfm" />
                        </cfif>
                    </div>

                    <cfif #pgFilename# is not "">
                        <cfinclude template="/include/#pgFilename#" />
                    </cfif>
                </div>
            </div>

            <cfinclude template="/include/footer.cfm" />
        </div>
    </div>

    <cfparam name="pgdir" default="" />
    <cfparam name="pgid" default="0" />

    <!--- Modal for Support Center --->
    <div id="z" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #f3f7f9;">
                    <h4 class="modal-title" id="standard-modalLabel">Support Center</h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"></button>
                </div>
                <div class="modal-body">
                    Click icon on the bottom right of the TAO program window
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $("#remoteSupportForm").on("show.bs.modal", function(event) {
                // Place the returned HTML into the selected element
                $(this).find(".modal-body").load("/include/RemoteSupportForm.cfm<cfoutput>?pgid=#pgid#&pgdir=#pgdir#&qstring=#cgi.query_string#&userrole=#userrole#</cfoutput>");
            });
        });
    </script>

    <div id="remoteSupportForm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #f3f7f9;">
                    <h4 class="modal-title" id="standard-modalLabel">Support Center</h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="false"></button>
                </div>
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>

    <script>
        window.onerror = function(message, source, lineno, colno, error) {
            console.error(`Error: ${message}\nSource: ${source}\nLine: ${lineno}\nColumn: ${colno}\nError object: ${JSON.stringify(error)}`);
            return true; // Prevents the default browser error handling
        };
    </script>

    <cfoutput>
        #pagelinks.bottom_links#
    </cfoutput>

    <!-- Loop through the array of include links and include each file -->
    <cfloop array="#includeLinksArray#" index="includeFile">
        <cfinclude template="#includeFile#">
    </cfloop>
</body>
</html>
