<CFINCLUDE template="/include/remote_load.cfm" />
<cfparam name="email_user" default="Y" />

<cfparam name="patchnote" default="" />
<cfquery datasource="#dsn#" name="find"  >
    select verid from taoversions order by verid desc limit 1
</cfquery>

<cfoutput><cfset next_verid = #find.verid# /></cfoutput>

<cfquery datasource="#dsn#" name="update"  >
update tickets
 set ticketCompletedDate =  <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" />

    ,complete_email = 1
    where ticketid = #recid#
    </cfquery>


<cfquery datasource="#dsn#" name="details"  >
    SELECT u.isbetatester,
p.pgid,
    t.ticketID as recID,
    t.ticketID as pk
    ,CONCAT(u.userfirstname,' ',u.userlastname) AS col1
    ,'User' as head1
    ,'Date' as head2
    ,'Time' as head3
    ,'Page' as head4
    ,'Status' as head5
    ,'Title' as head6
    ,u.useremail
    ,u.userfirstname
    ,'Response' as head7
,'Completed' as head8
,t.ticketResponse  as col7
,t.ticketCompletedDate as col8
    ,t.ticketdetails
        ,CONCAT(u.userfirstname,' ',u.userlastname) AS col1
    ,t.ticketCreatedDate AS col2
    ,t.ticketCreatedDate AS col3
    ,p.pgname AS col4
    ,t.ticketStatus AS col5
    ,t.ticketName AS col6
    ,t.ticketResponse
    ,t.ticketCompletedDate
    ,p.pgname
    ,t.tickettype
    ,p.pgdir
    ,t.complete_email
    ,t.initial_email
    FROM tickets t
    INNER JOIN taousers u ON u.userid = t.userid
    INNER JOIN pgpages p ON p.pgid = t.pgid
    WHERE t.ticketid = #recid#
</cfquery>




<cfset to_email = details.useremail />


<cfif #email_user# is "Y">
<cfmail from="support@theactorsoffice.com" failto="kevinking7135@gmail.com" replyto="support@theactorsoffice.com" to="#to_email#" cc="support@theactorsoffice.com"  
         usessl="true"
         usetls="true"
     
       
        subject="re: TAO TICKET NO #details.recid#" type="HTML">
    <HTML>
       <head><title>TAO TICKET NO #details.recid#</title>

       </head>
       <body>
           <!--- Style Tag in the Body, not Head, for Email --->
           <style type="text/css">
               body { font-size: 14px; }
           </style>
          <p>Hi #details.userfirstname#,</p>
            <p>This is to inform you that your ticket (no. #details.recid#) has been completed.</p>
           <cfif #trim(details.ticketresponse)# is not "">
           <p>#details.ticketresponse#</p>
           </cfif>
           <p>If there are any further issues on this topic, please open another ticket.</p>
 
           
           
           <p>&nbsp;</p>
           <p>Best,</p>
        
           <p>Kevin King<BR>Lead Developer<BR>The Actor's Office</p>
                 
                 <p>&nbsp;</p>
           
             <table class="main_html" style="direction: ltr;                                                                                                        border-radius: 0;                                    moz-border-radius:0;                                    khtml-border-radius:0;                                    o-border-radius:0;                                    webkit-border-radius:0;                                    ms-border-radius:0;                                    border-collapse: collapse;">
                    <tbody>
                        <tr>
                            <td>

                                <table cellpadding="0" cellspacing="0" class="ws-tpl" style="font-family: Verdana; line-height: 1.25;padding-bottom: 10px;color:##000;">
                                    <tbody>
                                        <tr>
                                            <td style="vertical-align: top; padding-right: 24px;">

                                                <table cellpadding="0" cellspacing="0" class="ws-tpl-photo" style="width:65px;">
                                                    <tbody>
                                                        <tr>
                                                            <td><img src="https://d36urhup7zbd7q.cloudfront.net/9f1033c8-aa07-4e56-a7e8-dedf97184598/IMG_4968.format_png.resize_200x.jpeg" height="100" width="65" style="width: 65px; border-radius: 0px; height: 100px;" class="fr-fil fr-dib"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                       </tr>
                                    </tbody>
                                </table>

                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr>
                                            <td style="line-height:0;">
                                                <br>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <table cellpadding="0" cellspacing="0" style="opacity:0!important;">
                    <tbody>
                        <tr>
                            <td height="1" style="height: 1px!important; width:1px!important; font-size: 0px!important;" width="1">&zwnj;</td>
                        </tr>
                    </tbody>
                </table>

           
           
           
           
           
           
            <p>&nbsp;</p>
                 <hr>
                 
           <h3>Ticket  No #details.recid# Details</h3>      
                 <p> Submitted by #details.col1# on    #Dateformat("#details.col2#","long")# at  #TimeFormat("#details.col3#","medium")#</p>
                 <p><strong>Type:</strong> #details.tickettype#</p>
                  <p><strong>Status:</strong> #details.col5#</p>
                  <p><strong>User Details:</strong> #details.ticketdetails#</p>
                   <p><strong>Support Response:</strong> #details.ticketresponse#</p>
                <p> Completed by Kevin King on    #Dateformat("#details.ticketCompletedDate#","long")# at  #TimeFormat("#details.ticketCompletedDate#","medium")#</p>
       </body>
    </HTML>
</cfmail>
    </cfif>
    


    
    <cflocation url="/app/admin-support-details/?recid=#recid#" >
        
        


