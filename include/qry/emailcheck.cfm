                <cfquery datasource="#dsn#" name="emailcheck" maxrows="1">
                    SELECT valueText as email
                    FROM contactitems
                    WHERE valueCategory = 'Email'
                    AND contactID = #currentid# AND itemstatus = 'Active'
                    order by primary_yn desc
                </cfquery>