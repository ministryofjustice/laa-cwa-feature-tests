# require "dbi"

# begin
#     dbConnection = DBI.connect("cwa-app1.aws.dev.legalservices.gov.uk", "apps", "app5cwa")
#     stmt = dbConnection.prepare("SELECT * FROM CUSTOMERS")
#     stmt.execute(100)
#     stmt.fetch do |customer|
#         puts "Customer ID :- #{customer[0]}"
#         puts "Customer Name :- #{customer[1]}, #{customer[2]}"
#         puts "Customer Age :- #{customer[3]}"
#     end
#     stmt.finish
# rescue DBI::DatabaseError => de
#     puts de.errstr
# ensure
#     if dbConnection
#         dbConnection.disconnect
#     end
# end

require:
require 'execjs'
require 'date'
require 'oci8'
require 'sequel'

in the page (siteprism)  or step definitions
def delete_Inclusao
conn = OCI8.new('apps', 'app5cwa','localhost:1571/cwa') conn.exec('table WHERE login = :1', 'xxxx')
conn.commit
end