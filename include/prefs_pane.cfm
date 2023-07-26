<h4>Preferences</h4>

<h5>

    Default Settings 
    
    <a title="Edit" href="" title="Update calendar setings" data-bs-toggle="modal" data-bs-target="#updatecal">
    
    <i class="mdi mdi-square-edit-outline"></i>
    
    </a>

</h5>

<div class="row" style="margin: auto;">

    <div class="col-md-2 p-2">

        <strong>Start time:</strong>

    </div>

    <div class="col-md-10 p-2">

        <cfoutput>

            <a href="" title="Start time for your Calendar Day" data-bs-toggle="modal" data-bs-target="##updatecal">#details.calstarttime#

            </a>

        </cfoutput>

    </div>

    <div class="col-md-2 p-2">

        <strong>End time:</strong>

    </div>

    <div class="col-md-10 p-2">

        <cfoutput>

            <a href="" title="End time for your Calendar Day" data-bs-toggle="modal" data-bs-target="##updatecal">#details.calendtime#

            </a>

        </cfoutput>

    </div>

</div>

<div class="row" style="margin: auto;">

    <div class="col-md-2 p-2"><strong>Rows Per Page:</strong></div>

    <div class="col-md-10 p-2">

        <cfoutput>

            <a href="" title="Default Rows for Relationships Table" data-bs-toggle="modal" data-bs-target="##updatecal">#details.defRows#</a>

        </cfoutput>

    </div>




    <div class="col-md-2 p-2">

        <strong>Time Zone:</strong>

    </div>

    <div class="col-md-10 p-2">

        <cfoutput>

            <a href="" title="Default State for your Contacts" data-bs-toggle="modal" data-bs-target="##updatecal">#details.tzid#</a>

        </cfoutput>

    </div>

</div>

<h5>

    My Newsletter

    <a title="Edit" href="" title="Update calendar setings" data-bs-toggle="modal" data-bs-target="#updatenewsletter">

        <i class="mdi mdi-square-edit-outline"></i>

    </a>

</h5>

<div class="row" style="margin: auto;">

    <div class="col-md-2 p-2"><strong>Newsletter?</strong>

    </div>

    <div class="col-md-10 p-2">

        <a title="Edit" href="" title="Update calendar setings" data-bs-toggle="modal" data-bs-target="#updatenewsletter">

            <cfif #details.nletter_yn# is "Y">Yes</cfif>

            <cfif #details.nletter_yn# is not "Y">No</cfif>

        </a>

    </div>

    <div class="col-md-2 p-2">

        <strong>Newsletter Link</strong>

    </div>

    <div class="col-md-10 p-2">

        <cfif #details.nletter_yn# is "Y">

            <cfif #details.nletter_link# is not "">

                <cfif #left('#details.nletter_link#','4')# is "http">

                    <cfoutput>

                        <cfset new_nletter_link="#details.nletter_link#" />

                    </cfoutput>

                </cfif>

                <cfif #left('#details.nletter_link#','4')# is not "http">

                    <cfoutput>

                        <cfset new_nletter_link="http://#details.nletter_link#" />

                    </cfoutput>

                </cfif>

                <cfoutput>

                    <A HREF="#new_nletter_link#" target="external">#details.nletter_link#</A>

                </cfoutput>

            </cfif>

            <cfif #details.nletter_link# is "">

                <i>Please add your newsletter link. </i>

            </cfif>

        </cfif>

    </div>

</div>


   <cfquery datasource="#dsn#" name="subsites">
        SELECT submitsiteid,submitsitename, catlist
        FROM audsubmitsites_user 
        WHERE userid = #userid#
        order by submitsitename
    </cfquery>


<h5>

    My Submission Sites

</h5>

<cfloop query="subsites"> 
<cfoutput>

    <div class="col-md-1 p-2">
<a title="Edit" >

                                <i class="mdi mdi-square-edit-outline"></i>

                            </a>

    </div>

      <div class="col-md-2 p-2">#subsites.submitsitename#

    </div>



    </cfoutput>

    </cfloop>
