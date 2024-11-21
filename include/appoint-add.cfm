<!--- This ColdFusion page handles the creation of an appointment with various input fields and validation. --->

<cfparam name="rcontactid" default="0"/>

<style>
  #hidden_div {
    display: none;
  }
</style>

<cfinclude template="/include/qry/relationships_13_1.cfm"/>
<cfinclude template="/include/qry/durations.cfm"/>
<cfinclude template="/include/qry/eventtypes_user_443_2.cfm"/>

<div class="container">
  <div class="row">
    <div class="col-xl-6 col-lg-8 col-md-12">
      <div class="card">
        <!--- card body --->

        <div class="card-body">Test</div>

      </div>
    </div>
  </div>
</div>
<style>
  .card-body {
    padding-bottom: 15rem;
  }
</style>
<script>
  $(document).ready(function () {
    $(".parsley-examples").parsley();
  });
</script>

<script>
  function showDiv(divId, element) {
    var checked = document.querySelectorAll('input[name="dow"]:checked');
    var hiddenDiv = document.getElementById(divId);

    if (checked.length === 0) {
      hiddenDiv.style.display = 'none';
      document
        .getElementById("endRecur")
        .value = "";
      $("#endRecur").prop('required', false);
    } else {
      hiddenDiv.style.display = 'block';
      $("#endRecur").prop('required', true);
    }
  }
</script>

<script>
  $('select[name=eventStartTime]').on("change", function () {
    var theSelectedIndex = $(this)[0].selectedIndex;
    $.each($('select[name=eventStopTime] option'), function () {
      var endOptionIndex = $(this).index();
      if (endOptionIndex < theSelectedIndex) {
        $(this).attr('disabled', 'disabled');
      } else {
        $(this)
          .removeAttr('disabled')
          .prop('selected', true);
        return false;
      }
    });
  });
</script>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), '\')#"/>
<cfinclude template="/include/bigbrotherinclude.cfm"/>
