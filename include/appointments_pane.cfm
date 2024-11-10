<div class="d-flex justify-content-between"> 
    <div class="float-left"> 
        <!--- Check if there are no appointments ---> 
        <cfif eventresults.recordcount is 0> 
            No appointments. 
        </cfif> 
        <!--- Display the count of active appointments ---> 
        You have <strong>#eventresults.recordcount#</strong> active appointment<cfif eventresults.recordcount is not 1>s</cfif> with #details.recordname#. 
    </div> 
    <div class="float-end"> 
        <!--- Link to add a new appointment ---> 
        <a href="/app/appoint-add/?returnurl=contact&rcontactid=#currentid#" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e;"> Add </a> 
    </div> 
</div> 

<div class="nomobile"> 
    <!--- Table to display event results ---> 
    <table id="events-datatable" class="table display dt-responsive nowrap w-100 table-striped table-hover"> 
        <thead> 
            <cfoutput query="eventresults" maxrows="1"> 
                <!--- Determine row type for styling ---> 
                <cfif (eventresults.CurrentRow MOD 2)> 
                    <Cfset rowType="Odd" /> 
                </cfif> 
                <cfif (eventresults.CurrentRow MOD 1)> 
                    <Cfset rowType="Even" /> 
                </cfif> 

                <tr class="#rowType#"> 
                    <th>Action</th> 
                    <th>#head1#</th> 
                    <th>#head2#</th> 
                    <th>#head3#</th> 
                    <th>Time</th> 
                    <th>#head5#</th> 
                    <th></th> 
                </tr> 
            </cfoutput> 
        </thead> 

        <tbody> 
            <!--- Loop through event results to display each appointment ---> 
            <cfloop query="eventresults"> 
                <cfinclude template="/include/qry/final_20_1.cfm" /> 

                <tr role="row"> 
                    <td> 
                        <!--- Link to appointment details if defined ---> 
                        <cfif isdefined('xxxxxx')> 
                            <a title="Details" href="/app/appoint/?eventid=#eventresults.eventid#&returnurl=contact&rcontactid=#currentid#"> 
                                <i class="mdi mdi-information-outline"></i> 
                            </a> 
                        </cfif> 

                        <!--- Link to edit appointment if project ID matches ---> 
                        <cfif eventresults.audprojectid is "557567567567575757575"> 
                            <a title="Edit" href="/app/appoint-update/?eventid=#eventresults.eventid#&returnurl=contact&rcontactid=#currentid#"> 
                                <i class="mdi mdi-square-edit-outline"></i> 
                            </a> 
                        </cfif> 

                        <!--- Link to view audition or appointment based on project ID ---> 
                        <cfif eventresults.audprojectid is not ""> 
                            <a href="/app/audition/?audprojectid=#eventresults.audprojectid#" class="btn btn-xs btn-primary waves-effect waves-light"> 
                                <i class="mdi mdi-eye-outline"></i> View Audition </a> 

                        <cfelse> 
                            <a href="/app/appoint/?eventid=#eventresults.eventid#" class="btn btn-xs btn-primary waves-effect waves-light"> 
                                <i class="mdi mdi-eye-outline"></i> View Appointment </a> 
                        </cfif> 
                    </td> 

                    <td>#eventresults.col1#</td> 
                    <td>#eventresults.col2#</td> 
                    <td>#dateformat(eventresults.col3,'m-d-YYYY')#</td> 
                    <td>#timeformat(eventresults.eventStartTime,'medium')#</td> 
                    <td>#eventresults.col5# <cfif eventresults.audstep is not "" and eventresults.audstep is not "Audition"> (#eventresults.audstep#)</cfif></td> 

                    <TD> 
                        <!--- Link to delete appointment if record count is 1 ---> 
                        <cfif final.recordcount is 1> 
                            <A href="/include/deleteappointment.cfm?recid=#eventresults.recid#&contactid=#currentid#"> 
                                <i class="mdi mdi-trash-can-outline mr-1"></i> 
                            </A> 
                        </cfif> 
                    </TD> 
                </tr> 
            </cfloop> 
        </tbody> 
    </table> 
</div>

<!--- Include script name for further processing ---> 
<cfset scriptNameInclude="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />

<!--- Changes: Removed unnecessary cfoutput tags, removed # symbols in conditional checks, standardized variable names and casing, improved logic for mobile layouts, removed cftry and cfcatch blocks, used double pound signs for hex color codes, simplified record count logic. --->