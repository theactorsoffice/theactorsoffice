<cfset cleanPhoneNumber = reReplace(phoneNumber, "[^0-9]|^\+1(?=\d{10})$", "", "ALL")>
    
<cfif "#len(cleanPhoneNumber)#" is "10">

    <cfoutput>
    <cfset formatPhoneNumber = "(#left(cleanPhoneNumber, 3)#) #mid(cleanPhoneNumber, 4, 3)#-#right(cleanPhoneNumber, 4)#" />
    <cfset anchorPhoneNumber = "#left(cleanPhoneNumber, 3)#-#mid(cleanPhoneNumber, 4, 3)#-#right(cleanPhoneNumber, 4)#" />
        
        </cfoutput>
        
<cfelse>
    <Cfoutput>
    <cfset formatPhoneNumber = "#phoneNumber#" /> 
    <cfset anchorPhoneNumber = "#cleanPhoneNumber#" /> 
        </Cfoutput>
    </cfif>
    
    <!--  [^0-9]|^\+1(?=\d{10})$ -->

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
