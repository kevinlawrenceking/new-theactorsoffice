<cfparam name="step" default="1" />

<script>
    function unlock() {
        document.getElementById('buttonSubmit').removeAttribute("disabled");
    }
</script>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h5>Step One: Import Template</h5>
                <p> Download the <a href="/include/auditionimporttemplates.xlsx" target="new"> <strong><i class="fe-upload"></i> Import Template</strong> </a> to copy and paste all the events you'd like to import. <strong>Imports must be in this format.</strong> </p>
                <h5>Step Two: Upload Template</h5>
                <p>Once you've populated and saved the Import Template as an .xlsx file, select the file and upload.</p>
                <form action="/include/upload_audition.cfm" method="post" enctype="multipart/form-data" id="upload">
                    <input type="hidden" name="userid" value="#userid#">
                    <input name="file" onchange="unlock();" type="file">
                    <p></p>
                    <input type="submit" value="Upload" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e" id="buttonSubmit" disabled>
                </form>
            </div>
        </div>
    </div>
</div>

<cfif isDefined('uploadid')>
    <cfinclude template="/include/qry/upload_details_140_1.cfm" />
    <cfset conlist = valuelist(upload_details.audprojectid) />
    <cfinclude template="/include/qry/results_140_2.cfm" />
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="header-title">Events imported <span class="small right"></span></h4>
                    <div class="d-flex justify-content-between">
                        <div class="float-left">
                            <p>#results.recordcount# events were imported. Click on a name to view details.</p>
                        </div>
                    </div>
                    <table id="basic-datatable" class="table display dt-responsive nowrap w-100 table-striped" role="grid">
                        <thead>
                            <cfoutput query="results" maxrows="1">
                                <tr>
                                    <th>#head1#</th>
                                    <th>#head2#</th>
                                    <th>#head3#</th>
                                    <th>#head4#</th>
                                    <th>#head5#</th>
                                    <th>#head6#</th>
                                </tr>
                            </cfoutput>
                        </thead>
                        <tbody>
                            <cfloop query="results">
                                <cfinclude template="/include/qry/errs_125_2.cfm" />
                                <cfset err_list = valuelist(errs.error_msg)>
                                <cfoutput>
                                    <cfif results.currentrow MOD 2 EQ 1>
                                        <cfset newclass="odd">
                                    <cfelse>
                                        <cfset newclass="even">
                                    </cfif>
                                    <tr class="#newclass#" role="row" id="row-#results.id#">
                                        <td> 
                                            <a href="/app/audition/?audprojectid=#results.audprojectid#" class="text-body font-weight-semibold"> 
                                                #DateFormat(results.col1b, "mm/dd/yyyy")# 
                                            </a> 
                                        </td>
                                        <td> 
                                            <cfif len(results.audprojectid)>
                                                <a href="/app/audition/?audprojectid=#results.audprojectid#">#col2#</a> 
                                            <cfelse> 
                                                #col2# 
                                            </cfif> 
                                        </td>
                                        <td>#col3#</td>
                                        <td>#col4#</td>
                                        <td>#col5#</td>
                                        <td> 
                                            <cfif col6 EQ "invalid">
                                                <a href="javascript:void(0);" data-toggle="modal" data-target="##fixModal" onclick="loadForm(#results.id#)" title="#err_list#"> 
                                                    <font color="red">Invalid <i class="fe-search"></i></font> 
                                                    <button type="button" class="btn btn-sm btn-warning" onclick="loadForm(#results.id#)">Fix</button> 
                                                </a> 
                                            <cfelse> 
                                                #col6# 
                                            </cfif> 
                                        </td>
                                    </tr>
                                </cfoutput>
                            </cfloop>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</cfif>

<cfinclude template="/include/qry/imports_140_4.cfm" />

<cfif imports.recordcount GT 0>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="header-title">Import History <span class="small right"></span></h4>
                    <div class="d-flex justify-content-between">
                        <div class="float-left">
                            <p>You have <strong>#imports.recordcount#</strong> imports.</p>
                        </div>
                    </div>
                    <table id="basic-datatable-history" class="table dt-responsive nowrap w-100 table-striped" role="grid">
                        <thead>
                            <tr>
                                <th width="50">Batch ID</th>
                                <th>Date</th>
                                <th>Time</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfloop query="imports">
                                <cfoutput>
                                    <tr>
                                        <td><a title="View" href="/app/auditions/?byimport=#imports.uploadid#">#imports.uploadid#</a></td>
                                        <td>#DateFormat(imports.timestamp, "mm/dd/yyyy")#</td>
                                        <td>#TimeFormat(imports.timestamp, "HH:mm:ss")#</td>
                                    </tr>
                                </cfoutput>
                            </cfloop>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</cfif>

<div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 9999;">
    <div id="successToast" class="toast align-items-center text-bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                Record updated successfully!
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>

<div class="modal fade" id="fixModal" tabindex="-1" role="dialog" aria-labelledby="fixModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fixModalLabel">Fix Invalid Record</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="fixForm" onsubmit="return submitFixForm();">
                    <input type="hidden" name="recordId" id="recordId">
                    <div class="form-group">
                        <label for="projName">Project</label>
                        <input type="text" class="form-control" name="projName" id="projName">
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="audRoleName">Role</label>
                            <input type="text" class="form-control" name="audRoleName" id="audRoleName">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="projDate">Project Date</label>
                            <input type="date" class="form-control" name="projDate" id="projDate">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="audsubcatid">Category</label>
                            <select class="form-control" name="audsubcatid" id="audsubcatid">
                                <option value="">Select Category</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="audsource">Source</label>
                            <select class="form-control" name="audsource" id="audsource">
                                <option value="">Select Source</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="cdf