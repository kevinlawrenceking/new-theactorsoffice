<script>
$(function() {
    $("#autocomplete").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: '/app/autolookup.cfm',
                dataType: 'json',
                data: {
                    userid: '<cfoutput>#userid#</cfoutput>',
                    searchTerm: request.term
                },
                success: function(data) {
                    response($.map(data.suggestions, function(item) {
                        return {
                            label: item.value + " (" + item.data.category + ")",
                            value: item.value,
                            id: item.id,
                            category: item.data.category
                        };
                    }));
                }
            });
        },
        minLength: 2,
        select: function(event, ui) {

            $("#selectedId").val(ui.item.id);
            $("#category").val(ui.item.category);

            $("#submitform").submit();
        },
        open: function() {
            var inputWidth = $("#autocomplete").outerWidth();
            $(".ui-autocomplete").css({
                "width": (inputWidth * 1.5) + "px",
                "white-space": "nowrap" 
            });
        }
    });
});

</script>
