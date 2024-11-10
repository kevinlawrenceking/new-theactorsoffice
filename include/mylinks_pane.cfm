<!--- This ColdFusion page handles the display of site types and their associated links, including modals for adding and updating links and panels. --->
<cfinclude template="/include/qry/sitetypes_535_1.cfm" />
<cfinclude template="/include/qry/mylinks_159_1.cfm" />

<script>
$(document).ready(function() {
    $("##paneladd").on("show.bs.modal", function(event) {
        <!--- Load the HTML for adding a new panel into the modal body --->
        $(this).find(".modal-body").load("/include/remotePanelAdd.cfm?userid=<cfoutput>#userid#</cfoutput>&pgrtn=P");
    });
});
</script>

<cfloop query="sitetypes">
    <script>
    $(document).ready(function() {
        $("##addlink_<cfoutput>#sitetypes.sitetypeid#</cfoutput>").on("show.bs.modal", function(event) {
            <!--- Load the HTML for adding a new link into the modal body --->
            $(this).find(".modal-body").load("/include/remotelinkAdd.cfm?new_sitetypeid=<cfoutput>#sitetypes.sitetypeid#</cfoutput>&userid=<cfoutput>#userid#</cfoutput>");
        });
    });
    </script>

    <cfset modalId = "addlink_" & sitetypes.sitetypeid />
    <cfset modalTitle = "Add Custom " & sitetypes.sitetypeName />
    <cfinclude template="/include/modal.cfm" />

    <script>
    $(document).ready(function() {
        $("##updateheading<cfoutput>#sitetypes.sitetypeid#</cfoutput>").on("show.bs.modal", function(event) {
            <!--- Load the HTML for updating the panel title into the modal body --->
            $(this).find(".modal-body").load("/include/remoteheadingupdate.cfm?new_sitetypeid=<cfoutput>#sitetypes.sitetypeid#</cfoutput>&userid=<cfoutput>#userid#</cfoutput>");
        });
    });
    </script>

    <cfset modalId = "updateheading" & sitetypes.sitetypeid />
    <cfset modalTitle = "Update Panel Title" />
    <cfinclude template="/include/modal.cfm" />
</cfloop>

<cfloop query="mylinks">
    <script>
    $(document).ready(function() {
        $("##updatelink_<cfoutput>#mylinks.id#</cfoutput>").on("show.bs.modal", function(event) {
            <!--- Load the HTML for updating a link into the modal body --->
            $(this).find(".modal-body").load("/include/remotelinkUpdate.cfm?id=<cfoutput>#mylinks.id#</cfoutput>");
        });
    });
    </script>

    <cfset modalId = "updatelink_" & mylinks.id />
    <cfset modalTitle = mylinks.sitetypeName & " Link Update" />
    <cfinclude template="/include/modal.cfm" />
</cfloop>

<cfset modalId = "paneladd" />
<cfset modalTitle = "Custom Panel Add" />
<cfinclude template="/include/modal.cfm" />

<!--- Rest of the code goes here --->

<!--- Changes were made according to standards 2, 3, 5, 6, 9 and 10. --->