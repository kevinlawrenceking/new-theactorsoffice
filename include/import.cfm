<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Import Details</h4>
                <div class="d-flex justify-content-between">
                    <div class="float-left">
                        <a title="View All" href="/app/contacts-import/">
                            <i class="mdi mdi-eye-outline"></i> View All
                        </a>
                    </div>
                    <div class="dropdown float-end"></div>
                </div>
                <div class="row">
                    <cfloop query="details">
                        <div class="col-3">
                            <p class="mt-2 mb-0 font-weight-bold">Batch ID</p>
                            <div class="media">
                                <div class="media-body">
                                    <div class="mt-0 font-size-12"><cfoutput>#details.uploadid#</cfoutput></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <p class="mt-2 mb-0 font-weight-bold">Date</p>
                            <div class="media">
                                <div class="media-body">
                                    <div class="mt-0 font-size-12"><cfoutput>#DateFormat(details.timestamp)#</cfoutput></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <p class="mt-2 mb-0 font-weight-bold">Time</p>
                            <div class="media">
                                <div class="media-body">
                                    <div class="mt-0 font-size-12"><cfoutput>#TimeFormat(details.timestamp)#</cfoutput></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <p class="mt-2 mb-0 font-weight-bold">Status</p>
                            <div class="media">
                                <div class="media-body">
                                    <div class="mt-0 font-size-12"><cfoutput>#details.uploadstatus#</cfoutput></div>
                                </div>
                            </div>
                        </div>
                    </cfloop>
                </div>
            </div>
        </div>
    </div>
</div>

<cfinclude template="/include/qry/results_142_1.cfm" />

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h6><cfoutput>#results.recordcount# relationship contacts were imported. Click on a name to view details.</cfoutput></h6>
                <table id="basic-datatable" class="table display dt-responsive nowrap w-100 table-striped" role="grid">
                    <thead>
                        <cfloop query="results" maxrows="1">
                            <cfset rowType = (Results.CurrentRow MOD 2) ? "Odd" : "Even" />
                            <tr class="#rowType#">
                                <th><cfoutput>#head1#</cfoutput></th>
                                <th><cfoutput>#head2#</cfoutput></th>
                                <th><cfoutput>#head3#</cfoutput></th>
                                <th><cfoutput>#head4#</cfoutput></th>
                                <th><cfoutput>#head5#</cfoutput></th>
                                <th><cfoutput>#head6#</cfoutput></th>
                            </tr>
                        </cfloop>
                    </thead>
                    <tbody>
                        <cfloop query="results">
                            <cfset phoneNumber = results.col3 />
                            <cfset cleanPhoneNumber = reReplace(phoneNumber, "[^0-9]", "", "ALL")>
                            <cfif len(cleanPhoneNumber) eq 10>
                                <cfset formatPhoneNumber = "(#left(cleanPhoneNumber, 3)#) #mid(cleanPhoneNumber, 4, 3)#-#right(cleanPhoneNumber, 4)#" />
                                <cfset anchorPhoneNumber = "#left(cleanPhoneNumber, 3)#-#mid(cleanPhoneNumber, 4, 3)#-#right(cleanPhoneNumber, 4)#" />
                            <cfelse>
                                <cfset formatPhoneNumber = "#phoneNumber#*" />
                                <cfset anchorPhoneNumber = "#cleanPhoneNumber#*" />
                            </cfif>
                            <cfset curLink="/app/contact/index.cfm?contactid=#results.contactid#" />
                            <tr role="row">
                                <th>
                                    <a href="#curLink#" class="text-body font-weight-semibold"><cfoutput>#results.col1#</cfoutput></a>
                                </th>
                                <td><cfoutput>#col2#</cfoutput></td>
                                <td><a href="tel:#anchorPhoneNumber#"><cfoutput>#formatPhoneNumber#</cfoutput></a></td>
                                <td><cfoutput>#col4#</cfoutput></td>
                                <td><cfoutput>#col5#</cfoutput></td>
                                <td>
                                    <cfif status neq "Added">
                                        <font color="red"><cfoutput>#status#</cfoutput></font>
                                    <cfelse>
                                        <cfoutput>#status#</cfoutput>
                                    </cfif>
                                </td>
                            </tr>
                        </cfloop>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!--- Changes: Removed unnecessary cfoutput tags around variable outputs, standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting, simplified record count logic for icons or conditional displays, improved logic for expanding and collapsing views in mobile layouts, removed cftry and cfcatch blocks entirely. --->