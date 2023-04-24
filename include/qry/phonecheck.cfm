   <cfquery datasource="#dsn#" name="phonecheck" maxrows="1">
                SELECT valueText as phonenumber
                FROM contactitems
                WHERE valueCategory = 'Phone'
                AND contactID = #currentid# AND itemstatus = 'Active'
                ORDER BY primary_yn desc
            </cfquery>