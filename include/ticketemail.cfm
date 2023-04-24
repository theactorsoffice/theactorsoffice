<cfmail from="support@theactorsoffice.com" failto="kevinking7135@gmail.com" replyto="kevinking7135@gmail.com" to="#emailto#" bcc="kevinking7135@gmail.com"  cc="#emailcc#" 
         usessl="true"
         usetls="true"
        subject="TICKET NO #new_ticketid# - #emailsubject#" type="HTML">
    <HTML>
       <head><title>TAO TICKET NO #new_ticketid#</title>

       </head>
       <body>
           <!--- Style Tag in the Body, not Head, for Email --->
           <style type="text/css">
               body { font-size: 14px; }
           </style>
   
            <p>Ticket No. #new_ticketid# #emailmessage#</p>
         
           <cfif #emaillinkname# is not "" and #emaillink# is not "">
           <h4><A HREF="#emaillink#">#emaillinkname#</A></h4>
        </cfif>
 
 
           
           
           <p>&nbsp;</p>
       
        
           <p>TAO Support</p>
           <p>Automated Message Alert</p>
                 
          
     
           
           
           
           
           
           
     
       </body>
    </HTML>
    
</cfmail>