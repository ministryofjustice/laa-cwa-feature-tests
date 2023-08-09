require oci8
conn = OCI8.new('apps', 'app5cwa','host.docker.internal:1571/cwa')
statement = " select * from xxlsc_civil_scope_rules_v where mt1 = 'IACA'"
cursor = conn.parse(statement)

while r = cursor.fetch()
puts r.join(', ')
end

cursor.close
conn.logoff
