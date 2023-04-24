<cfparam name="contact_expand" default="true" />
<cfparam name="a" default="0" />
<cfparam name="d" default="0" />
<cfparam name="s" default="0" />


<cfparam name="contactcheckvisible" default="false" />
<cfparam name="maintenance_expand" default="false" />
<cfparam name="bytag" default="" />
<cfparam name="target_expand" default="false" />
<cfparam name="followup_expand" default="false" />
<cfparam name="all_expand" default="false" />
<cfparam name="pgaction" default="view" />

<cfif NOT #isdefined('session.pgaction')#>
    <cfset session.pgaction="view">
</cfif>
    <cfquery name="x" datasource="#dsn#" >	
  select * from taousers where userid in (select distinct userid from shares)
    </cfquery>
<div class="row">

    <div class="col-lg-12">

        <div class="card">

            <div class="card-body">
                <cfloop query="x" >
<cfoutput>
                #x.userfirstname# #x.userlastname#: <A HREF="https://#host#.theactorsoffice.com/share/?u=#left(passwordhash,10)#">https://#host#.theactorsoffice.com/share/?u=#left(passwordhash,10)#</A><BR/>
               </cfoutput>     
        
                </cfloop>
                
 



            </div>

        </div>

    </div>

    </div>






    <!-- end row -->

</div> <!-- container -->





