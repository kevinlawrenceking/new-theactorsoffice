 <cfparam name="details_recid" default="" />
 <cfparam name="details_pgid" default="" />

 <style>
     table.dataTable tbody td {
         word-break: break-word;
         vertical-align: top;
     }

 </style>

 <script>
     $(document).ready(function() {
         $("#remoteNewForm").on("show.bs.modal", function(event) {
             // Place the returned HTML into the selected element
             $(this).find(".modal-body").load("/include/RemoteNewForm.cfm?rpgid=<cfoutput>#pgid#&pgdir=#pgdir#</cfoutput>");
         });
     });

 </script>
 <cfset rpgid=rpgid />
 <cfset hh=1 />
 <cfparam name="child_yn" default="N" />

 <div class="row">
     <div class="col-12">
         <div class="card">
             <div class="card-body">
                 <h4 class="header-title">
                     <cfoutput>#pgHeading#</cfoutput>
                     <cfif #isdefined('hh')#><span class="small right">
                             <cfoutput>(#pgid#) </cfoutput>
                         </span></cfif>
                 </h4>
                 <cfif #child_yn# is "N">
                     <div class="d-flex justify-content-between">

                         <div class="float-left">

                             <cfif #results.recordcount# is "0">No #compname#. </cfif>
                          <p> <cfoutput>You have <strong>#results.recordcount#</strong> #compname#.</cfoutput>
</p>  
                         </div>
<cfif #isdefined('blkdfjs')#>
                         <div class="dropdown float-end">

                             <a href="#" class="dropdown-toggle arrow-none text-muted" data-bs-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal font-18"></i></a>

                             <div class="dropdown-menu dropdown-menu-right" style="">
            <cfif #findpage.allowadd_yn# is "Y">
                <a href="remoteNewForm.cfm" style="margin-bottom: 10px;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteNewForm" class="dropdown-item"><i class="mdi mdi-square-edit-outline mr-1"></i>Create</a></cfif>

                                 <a href="javascript:void(0);" class="dropdown-item"><i class="fe fe-external mr-1"></i>View</a>

                                 <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-content-copy mr-1"></i>Export</a>
                             </div>

                         </div>
</cfif>
                     </div>
                  <cfif #findpage.allowadd_yn# is "Y">
                     <div style="margin-bottom: 30px;"> <a href="remoteNewForm.cfm" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteNewForm" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e;margin-bottom: 10px;">

                             Add
                         </a>
                     </div>
                     </cfif>
                     
                 </cfif>
                 <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped" role="grid">
                     <thead>
                         <cfloop query="results" endrow="1">
                             <cfoutput>
                                 <cfif (Results.CurrentRow MOD 2)>
                                     <Cfset rowtype="Odd" />
                                     <cfelse>
                                         <Cfset rowtype="Even" />
                                 </cfif>


                                 <tr class="#rowtype#">
                                     <th width="50">Action</th>

                                     <cfloop index="i" from="1" to="#findresults.recordcount#">


                                         <th>#EVALUATE('head#i#')#</th>
                                     </cfloop>


                                 </tr>
                             </cfoutput>
                         </cfloop>
                     </thead>
                     <tbody>
                         <cfloop query="results">



                             <cfoutput>


                                 <cfif #update_type# is "modal">

                                     <script>
                                         $(document).ready(function() {
                                             $("##remoteUpdateForm#results.recid#").on("show.bs.modal", function(event) {
                                                 // Place the returned HTML into the selected element
                                                 $(this).find(".modal-body").load("/include/remoteUpdateForm.cfm?recid=#results.recid#&rpgid=#pgid#&pgaction=update&pgdir=#pgdir#&details_pgid=#details_pgid#&details_recid=#details_recid#");
                                             });
                                         });

                                     </script>

                                 </cfif>

                                 <script>
                                     $(document).ready(function() {
                                         $("##remoteDeleteForm#results.recid#").on("show.bs.modal", function(event) {
                                             // Place the returned HTML into the selected element
                                             $(this).find(".modal-body").load("/include/remoteDeleteForm.cfm?recid=#results.recid#&rpgid=#pgid#&pgaction=update&pgdir=#pgdir#");
                                         });
                                     });

                                 </script>




                                 <tr>

                                     <td>










                                         <CFINCLUDE template="/include/remote_load.cfm" />
                                         <cfquery datasource="#dsn#" name="FindDetails">
                                             SELECT pgid,pgdir FROM pgpages WHERE compid = #compid# AND pgid <> #pgid# AND pgfilename = 'details.cfm'
                                         </cfquery>

                                         <cfif #update_type# is "modal">

                                             <a title="Edit" href="UpdateModal.cfm?recid=#results.recid#" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateForm#results.recid#">

                                                 <i class="mdi mdi-square-edit-outline mr-1"></i>
                                             </a>

                                             <cfelseif #update_type# is "updateform">
                                                 <a title="Edit" href="/app/#finddetails.pgdir#/?recid=#results.recid#&pgaction=update">

                                                     <i class="mdi mdi-square-edit-outline mr-1"></i>
                                                 </a>

                                         </cfif>





<cfif #findpage.allowdetails_yn# is "Y">

                                         <cfif #findDetails.recordcount# is "1">

                                             <a title="View Details" href="/app/#finddetails.pgdir#/?recid=#results.recid#">

                                                 <i class="mdi mdi-eye-outline"></i>
                                             </a>

                                         </cfif>

                                             </cfif>
<cfif #findpage.allowdelete_yn# is "Y">
                                         <a title="Delete" href="DeleteModal.cfm?rpgid=#rpgid#&recid=#results.recid#" data-bs-toggle="modal" data-bs-target="##remoteDeleteForm#results.recid#">


                                             <i class="mdi mdi-trash-can-outline mr-1"></i>
    </a>

</cfif>



                                     </td>

                                     <cfloop index="i" from="1" to="#findresults.recordcount#">
                                         <cfset updatetype="#EVALUATE('updatetype#i#')#" />
                                         <cfset fname="#EVALUATE('fname#i#')#" />



                                         <td style="word-break: break-all;">

                                             <cfset fieldval="#EVALUATE('col#i#')#" />
                                             <cfset fieldvalfinal="#left('#fieldval#',100)#" />
                                             <cfif #len(fieldval)# gt "100">
                                                 #fieldvalfinal#...<cfelse>#fieldvalfinal#

                                             </cfif>


                                             <cfif #updatetype# is "order">

                                                 <cfif #currentrow# is not "#results.recordcount#">

                                                     <a title="Move up" href="/include/order.cfm?fname=#fname#&parent_id=#details_recid#&pgid=#details_pgid#&rpgid=#rpgid#&recid=#results.recid#&mode=down&current_val=#EVALUATE('col#i#')#">
                                                         <i class="mdi mdi-arrow-down-bold pl-2"></i></a>
                                                 </cfif>


                                                 <cfif #currentrow# is not "1">
                                                     <cfif #currentrow# is "#results.recordcount#">&nbsp;</cfif>


                                                     <a title="Move up" href="/include/order.cfm?fname=#fname#&parent_id=#details_recid#&pgid=#details_pgid#&rpgid=#rpgid#&recid=#results.recid#&mode=up&current_val=#EVALUATE('col#i#')#">
                                                         <i class="mdi mdi-arrow-up-bold  <cfif #currentrow# is " #results.recordcount#"> pl-3
                                                 </cfif>"></i>



                                             </cfif>
                                             </cfif>

                                         </td>

                                     </cfloop>


                                 </tr>



                                 <div id="remoteNewForm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                                     <div class="modal-dialog">
                                         <div class="modal-content">
                                             <div class="modal-header" style="background-color: ##f3f7f9;">
                                                 <h4 class="modal-title" id="standard-modalLabel">#compname#</h4>
                                                 <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                                             </div>
                                             <div class="modal-body">

                                             </div>
                                         </div>

                                     </div>

                                 </div>

                                 <cfif #update_type# is "modal">

                                     <div id="remoteUpdateForm#results.recid#" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                                         <div class="modal-dialog">
                                             <div class="modal-content">
                                                 <div class="modal-header" style="background-color: ##f3f7f9;">
                                                     <h4 class="modal-title" id="standard-modalLabel">#compname#</h4>
                                                     <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                                                 </div>
                                                 <div class="modal-body">

                                                 </div>
                                             </div>

                                         </div>

                                     </div>
                                 </cfif>


                                 <div id="remoteDeleteForm#results.recid#" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                                     <div class="modal-dialog">
                                         <div class="modal-content">
                                             <div class="modal-header" style="background-color: red;">
                                                 <h4 class="modal-title" id="standard-modalLabel">#compname#</h4>
                                                 <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="mdi mdi-close-thick"></i></button>
                                             </div>
                                             <div class="modal-body">

                                             </div>
                                         </div>

                                     </div>

                                 </div>



                             </cfoutput>

                         </cfloop>

                     </tbody>

                 </table>

             </div>
         </div>
     </div>



     <SCRIPT>
         $(document).ready(function() {
             $("#basic-datatable").DataTable({
                 

                "pageLength": 100 ,
                 responsive: true,
                 language: {
                     paginate: {
                         previous: "<i class='mdi mdi-chevron-left'>",
                         next: "<i class='mdi mdi-chevron-right'>"
                     }
                 },
                 drawCallback: function() {
                     $(".dataTables_paginate > .pagination").addClass("pagination-rounded")
                 }
             });
             var a = $("#datatable-buttons").DataTable({
                 lengthChange: !1,
                 buttons: [{
                     extend: "copy",
                     className: "btn-light"
                 }, {
                     extend: "print",
                     className: "btn-light"
                 }, {
                     extend: "pdf",
                     className: "btn-light"
                 }],
                 language: {
                     paginate: {
                         previous: "<i class='mdi mdi-chevron-left'>",
                         next: "<i class='mdi mdi-chevron-right'>"
                     }
                 },
                 drawCallback: function() {
                     $(".dataTables_paginate > .pagination").addClass("pagination-rounded")
                 }
             });

         });

     </SCRIPT>


     <cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
     <cfinclude template="/include/bigbrotherinclude.cfm" />
