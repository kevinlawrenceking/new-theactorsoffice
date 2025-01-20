<script>
    $(document).ready(function () {
        const $input = $('#autocomplete');
        const $suggestions = $('#contact-suggestions');

        $input.on('input', function () {
            const query = $input.val();
            if (query.length >= 2) {
                $.ajax({
                    url: '/include/qry/lookup_contacts.cfm',
                    method: 'GET',
                    data: { searchTerm: query },
                    success: function (response) {
                        $suggestions.empty();
                        if (response.data && response.data.length > 0) {
                            response.data.forEach(contact => {
                                $suggestions.append(`
                                    <li>
                                        <a href="${contact.contact_url}">${contact.col1}</a>
                                    </li>
                                `);
                            });
                            $suggestions.show();
                        } else {
                            $suggestions.hide();
                        }
                    },
                    error: function () {
                        console.error('Error fetching contacts.');
                        $suggestions.hide();
                    }
                });
            } else {
                $suggestions.hide();
            }
        });

        // Hide suggestions on outside click
        $(document).on('click', function (e) {
            if (!$(e.target).closest('#autocomplete, #contact-suggestions').length) {
                $suggestions.hide();
            }
        });
    });
</script>
