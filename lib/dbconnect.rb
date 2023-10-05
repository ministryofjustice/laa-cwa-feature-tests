require 'ruby-oci8'


class ChangeStartDate
    def change_start_date
conn = OCI8.new('username', 'password' ,'host.docker.internal:1571/cwa')
statement = ("UPDATE xxlsc_civil_scope_date_rules
    SET    start_date_active = '01-AUG-2023'
    WHERE  date_rule_id = (SELECT date_rule_id
                           FROM   xxlsc_civil_scope_rules
                           WHERE  mt1 = 'IMMA'
                           AND    mt2 = 'IMRN')
    AND  START_DATE_ACTIVE != '01-AUG-2023'")
cursor = conn.parse(statement)
changed = cursor.exec
conn.commit
printf "Number of rows updated: %d\n\n", changed
cursor.close
conn.logoff
    end
end