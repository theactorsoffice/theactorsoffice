<!--- Include remote load template --->
<CFINCLUDE template="/include/remote_load.cfm" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.js"></script>

<!--- Queries to fetch data --->
<cfquery datasource="#dsn#" name="FindRefContacts">
    SELECT recordname
    FROM contactdetails
    WHERE contactid = <cfqueryparam value="#contactid#" cfsqltype="CF_SQL_INTEGER">
</cfquery>

<cfquery datasource="#dsn#" name="FindRefPage">
    SELECT a.appname, a.appAuthor, c.compname, p.pgname, a.appId, a.appDescription, a.appLogoName, a.colorTopBar, a.colorLeftSideBar, a.mocktoday, a.mock_yn, c.compid, c.compDir, c.compTable, c.compowner, c.compIcon, c.menuYN, c.menuOrder, c.compInner, c.compRecordName, c.compActive, p.pgid, p.pgDir, p.pgTitle, p.pgHeading, p.pgFilename, p.datatables_YN, p.fullcalendar_YN, p.editable_YN, p.newdatatables_YN, p.pk
    FROM pgpages p
    INNER JOIN pgcomps c ON c.compID = p.compID
    INNER JOIN pgapps a ON a.appID = c.appid
    WHERE p.pgid = #ref_pgid#
</cfquery>

<!--- Output block for setting variables --->
<cfoutput>
    <cfset cookie.uploadDir_Contact = "#dir_contact_avatar_filename#" /> 
    <cfset cookie.return_url = "/app/contact/?contactid=#contactid#" />
    <cfset subtitle = "#FindRefContacts.recordname#" />
    <cfset browser_contact_avatar_loc="/media-#host#/users/#finduser.userid#/contacts/#contactid#" />
    <cfset browser_contact_avatar_filename="#browser_contact_avatar_loc#/avatar.jpg" />
    <cfset image_url = "#browser_contact_avatar_filename#" />
    <cfset picsize = ref_pgid neq 9 ? 200 : 300 />
    <cfset inputsize = ref_pgid neq 9 ? 200 : 300 />
</cfoutput>

<!--- HTML content --->
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h4 id="pageTitle">Upload Avatar</h4>
            <div id="instructions" class="alert alert-info">Select an image from your computer, resize and crop it, then click Update.</div>
            
            <div id="selectfile" class="mb-3">
                <input type="file" id="upload" class="form-control">
            </div>

            <div id="upload-input" class="croppie-container mb-3" style="width:<cfoutput>#inputsize#</cfoutput>px; height: <cfoutput>#inputsize#</cfoutput>px;"></div>

            <button id="uploadbutton" class="btn btn-primary upload-result">Update</button>
            <div id="cont" style="display:none;">
                <h5>Avatar has been updated!</h5>
                <a href="<cfoutput>#cookie.return_url#</cfoutput>"><button type="button" class="btn btn-primary">Continue</button></a>
            </div>
        </div>
    </div>
</div>

<!--- JavaScript for handling UI interactions --->

<!-- Your Custom Script -->
<script>
$(document).ready(function() {
    var $uploadCrop;

    // Function to initialize Croppie
    function initCroppie() {
        // If Croppie is already initialized, destroy it before reinitializing
        if ($uploadCrop) {
            $uploadCrop.croppie('destroy');
        }

        // Initialize Croppie
        $uploadCrop = $('#upload-input').croppie({
            enableExif: true,
            url: '<cfoutput>#image_url#</cfoutput>?ver=<cfoutput>#rand()#</cfoutput>',
            viewport: {
                width: <cfoutput>#picsize#</cfoutput>,
                height: <cfoutput>#picsize#</cfoutput>,
                type: 'circle'
            },
            boundary: {
                width: <cfoutput>#picsize#</cfoutput>,
                height: <cfoutput>#picsize#</cfoutput>
            }
        });
    }

    // Initialize Croppie for the first time
    initCroppie();

    $('#upload').on('change', function() { 
        var reader = new FileReader();
        reader.onload = function(e) {
            // Reinitialize Croppie with the new image
            initCroppie();
            $uploadCrop.croppie('bind', {
                url: e.target.result
            }).then(function() {
                console.log('jQuery bind complete');
            });
        }
        reader.readAsDataURL(this.files[0]);
        $('#uploadbutton').show();
    });

    $('.upload-result').on('click', function(ev) {
        $uploadCrop.croppie('result', {
            type: 'canvas',
            size: 'viewport'
        }).then(function(resp) {
            $.ajax({
                url: "/include/image_upload-contact2.cfm",
                type: "POST",
                data: {"picturebase": resp},
                success: function(data) {
                    $("#upload-input").html('<img src="' + resp + '" style="margin: 20px;" /><br>');
                    $('#uploadbutton').hide();
                    $('#selectfile').hide();
                    $('#cont').show();
                }
            });
        });
    });
});
</script>




<cfinclude template="/include/bigbrotherinclude.cfm" />
