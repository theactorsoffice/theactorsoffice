<CFINCLUDE template="/include/remote_load.cfm" />

 



   <cfif #catlist# is not "">
    <cfset sortedCatList = listSort(catlist, "numeric", "asc")>
</cfif>
    <cfabort>
   <cfquery datasource="#dsn#" name="find">
   Select submitsiteid from audsubmitsites_user where userid = #session.userid# and submitsitename = '#new_submitsitename#'
   </cfquery>

 

   <cfif #find.recordcount# is "1">
    <cfquery name="update" datasource="#dsn#" >   
        UPDATE `audsubmitsites_user` 
        set submitsitename = '#new_submitsitename#'
        ,isDeleted = 0
        
<cfif #catlist# is not "">
        ,catlist = '#sortedCatList#'
        <cfelse>

        ,catlist =NULL
        </cfif>
        where submitsiteid = #find.submitsiteid#
    </cfquery>



   </cfif>


     <cfif #find.recordcount# is "0">
   <cfquery datasource="#dsn#" name="add">
   INSERT INTO audsubmitsites_user (submitsitename, catlist, userid)
   values ('#new_submitsitename#', '#sortedCatList#', #session.userid#)
    </cfquery>


   </cfif>

 


    <cflocation url="/app/myaccount/?t4=1&tab4_expand=true" /> 
    