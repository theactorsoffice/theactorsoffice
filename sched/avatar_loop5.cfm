<!--- Read and hash the default gravatar image --->
<cffile action="readBinary" file="#ExpandPath('./default.jpg')#" variable="defaultImageBinary">
<cfset defaultHash = Hash(defaultImageBinary, 'SHA-256')>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Gallery</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container mt-5">
        <div class="row">

            <!-- ColdFusion Query -->
            <cfquery name="x" datasource="abo">
                SELECT distinct
                d.contactid,
                d.userid,
                i.valuetext,
                d.contactfullname,
                d.avatar_yn
                FROM
                contactdetails d INNER JOIN contactitems i ON i.contactid = d.contactid
                INNER JOIN taousers u ON u.userid = d.userid
                WHERE i.valuecategory = 'Email' AND i.valuetext <> '' AND i.valuetext NOT LIKE '%test%'
                AND i.avatar_yn = 'Y' 
                and u.userid in (1,12,17,99)
                ORDER BY d.contactfullname
            </cfquery>

            <!-- Bootstrap Gallery -->
            <cfoutput query="x">
                <!-- Check the hash of the image against the default -->
                <cfhttp url="https://app.theactorsoffice.com/media-app/users/#x.userid#/contacts/#x.contactid#/avatar.jpg" method="get" getasbinary="yes" result="contactImage">
                <cfset contactHash = Hash(contactImage.FileContent, 'SHA-256')>

                <cfif contactHash NEQ defaultHash>
                    <cfif x.currentRow MOD 5 EQ 1>
                        <div class="w-100"></div> <!-- new row every 5 items -->
                    </cfif>

                    <div class="col">
                        <div class="card">
                            <img src="https://app.theactorsoffice.com/media-app/users/#x.userid#/contacts/#x.contactid#/avatar.jpg" class="card-img-top" alt="#x.contactfullname#">
                            <div class="card-body">
                                <p class="card-text">#x.contactfullname#</p>
                                 <p class="card-text">#x.valuetext#</p>
                            </div>
                        </div>
                    </div>
                </cfif>
            </cfoutput>
            
        </div>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</body>
</html>
