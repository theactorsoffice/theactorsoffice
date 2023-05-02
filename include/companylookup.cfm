<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auto Lookup Field</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        #results {
            border: 1px solid #ccc;
            display: none;
            position: absolute;
        }
        #results div {
            padding: 5px;
            cursor: pointer;
        }
        #results div:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>

    <form>
    <input type="text" id="companySearch" autocomplete="off">
    <div id="results"></div>

</form>

    <script>
      $(document).ready(function() {
    $('#companySearch').on('input', function() {
        const searchTerm = $(this).val();
        if (searchTerm.length >= 2) {
            $.ajax({
                url: 'CompanyLookup.cfc',
                data: {
                    method: 'getCompanies',
                    searchTerm: searchTerm
                },
                dataType: 'json',
                success: function(data) {
                    const results = data.DATA;
                    const resultsDiv = $('#results');
                    resultsDiv.empty();
                    resultsDiv.css('display', 'block');

                    if (results.length > 0) {
                        for (let i = 0; i < results.length; i++) {
                            const coName = results[i][0];
                            const resultDiv = $('<div>').text(coName);
                            resultsDiv.append(resultDiv);
                        }
                    } else {
                        const addNewDiv = $('<div>').addClass('add-new').text(`Add new: ${searchTerm}`);
                        resultsDiv.append(addNewDiv);
                    }
                }
            });
        } else {
            $('#results').css('display', 'none');
        }
    });

    $('#results').on('click', 'div', function() {
        const selectedValue = $(this).text();
        if ($(this).hasClass('add-new')) {
            // Remove the "Add new: " prefix
            const newCompanyName = selectedValue.replace(/^Add new: /, '');
            $('#companySearch').val(newCompanyName);
            // Handle the new company addition logic here
        } else {
            $('#companySearch').val(selectedValue);
        }
        $('#results').css('display', 'none');
    });
});

    </script>
</body>
</html>
