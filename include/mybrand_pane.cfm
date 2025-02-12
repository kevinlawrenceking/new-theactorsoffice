<h4>My Essence
    <a href="" title="click for details" data-bs-toggle="modal" data-bs-target="#essencehelp">
        <i class="fe-info font-14 mr-1"></i>
    </a>
</h4>

<p>
    Add an 
    <a href="remoteAddContact.cfm?src=account" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="#remoteAddEssenceContact">
        <strong>Essence</strong>
    </a>
</p>

<div class="container mt-3">
    <div class="row row-cols-md-3 row-cols-1 g-3">
        <cfloop query="essence_sel">
            <div class="col">
                <cfoutput>
                    <script>
                        $(document).ready(function() {
                            $("##remoteUpdateEssenceContact_#essence_sel.id#").on("show.bs.modal", function(event) {
                                $(this).find(".modal-body").load("/include/remoteUpdateEssenceContact.cfm?userid=#userid#&src=account&essenceid=#essence_sel.id#");
                            });
                        });
                    </script>

                    <cfset modalid="remoteUpdateEssenceContact_#essence_sel.id#" />
                    <cfset modaltitle="Update Essence" />
                    <cfinclude template="/include/modal.cfm" />

                    <!--- Card Layout --->
                    <div class="card shadow-sm border-0 rounded">
                        <div class="card-body text-center">
                            <h5 class="card-title mb-2">#Essence_sel.Name#</h5>
                            <div class="d-flex justify-content-center gap-2">
                                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="##remoteUpdateEssenceContact_#essence_sel.id#">
                                    <i class="mdi mdi-pencil"></i> Edit
                                </button>
                                <button class="btn btn-outline-danger btn-sm" onclick="deleteEssence(#essence_sel.id#)">
                                    <i class="mdi mdi-trash-can"></i> Delete
                                </button>
                            </div>
                        </div>
                    </div>
                </cfoutput>
            </div>
        </cfloop>
    </div>
</div>

<script>
    function deleteEssence(id) {
        if(confirm("Are you sure you want to delete this essence?")) {
            window.location.href = "/app/myaccount/?ctaction=deleteessence&essenceid=" + id;
        }
    }
</script>
