# require 'oci8'
# conn = OCI8.new('apps', 'app5cwa','host.docker.internal:1571/cwa')
# statement = "select * from xxlsc_civil_scope_rules_v where mt1 = 'IACA'"
# cursor = conn.parse(statement)
# cursor.exec
# cursor.fetch() {|row|
#     print row
#    }
# cursor.close
# conn.logoff
