<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="UTF-8"> 
    <title>Detail Page</title> 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/include/libs/toastr.js/latest/toastr.min.css"> 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/include/libs/toastr.js/latest/toastr.min.js"></script> 
</head> 
<body> 
    <!--- Include details query template ---> 
    <cfinclude template="/include/qry/details_106_1.cfm" /> 

    <div class="container"> 
        <h1>Detail Page</h1> 
        <p id="detailText"><cfoutput>#details.valueText#</cfoutput></p> 
        <button class="btn btn-primary" id="editButton" data-itemid="<cfoutput>#details.itemId#</cfoutput>">Edit</button> 
    </div> 

    <!--- Edit Modal ---> 
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true"> 
        <div class="modal-dialog" role="document"> 
            <div class="modal-content" id="modalContent"> <!--- Modal content will be loaded here ---> </div> 
        </div> 
    </div>

    <script>
        $(document).ready(function() { 

            $('#editButton').on('click', function() { 

                var itemId = $(this).data('itemid'); 

                $.ajax({ 
                    url: '/include/getModalContent.cfm', 
                    type: 'GET', 
                    data: { itemid: itemId }, 
                    success: function(response) { 
                        $('#modalContent').html(response); 
                        $('#editModal').modal('show'); 
                    }, 
                    error: function(xhr, status, error) { 
                        toastr.error('Failed to load modal content: ' + error); 
                    } 
                }); 
            }); 

            $(document).on('submit', '#updateForm', function(event) { 

                event.preventDefault(); 

                if ($(this).parsley().isValid()) { 

                    $.ajax({ 
                        url: '/include/remoteUpdateCUpdate.cfm', 
                        type: 'POST', 
                        data: $(this).serialize(), 
                        success: function(response) { 
                            $('#detailText').text($('#valueText').val()); 
                            toastr.success('Details updated successfully'); 
                            $('#editModal').modal('hide'); 
                        }, 
                        error: function(xhr, status, error) { 
                            toastr.error('Update failed: ' + error); 
                        } 
                    }); 
                } 
            }); 
        });
    </script> 

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script> 

</body> 
</html>

<!--- Changes made based on standards:
1. Removed unnecessary cfoutput tags around variable outputs.
2. Standardized variable names and casing.
3. Ensured consistent attribute quoting, spacing, and formatting.
--->