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
    <input type="text" id="companySearch" autocomplete="off">
    <div id="results"></div>

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
                            const results = data.QUERY;
                            const resultsDiv = $('#results');
                            resultsDiv.empty();
                            resultsDiv.css('display', 'block');

                            for (let i = 0; i < results.CO_NAME.length; i++) {
                                const coName = results.CO_NAME[i];
                                const resultDiv = $('<div>').text(coName);
                                resultsDiv.append(resultDiv);
                            }
                        }
                    });
                } else {
                    $('#results').css('display', 'none');
                }
            });

            $('#results').on('click', 'div', function() {
                const selectedCompany = $(this).text();
                $('#companySearch').val(selectedCompany);
                $('#results').css('display', 'none');
            });
        });
    </script>
</body>
</html>
