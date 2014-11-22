killbill-firstdata-e4-plugin
============================

Plugin to use First Data Global Gateway e4 as a gateway.

Release builds are available on [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.kill-bill.billing.plugin.ruby%22%20AND%20a%3A%22firstdata-e4-plugin%22) with coordinates `org.kill-bill.billing.plugin.ruby:firstdata-e4-plugin`.

Requirements
------------

The plugin needs a database. The latest version of the schema can be found here: https://raw.github.com/killbill/killbill-firstdata-e4-plugin/master/db/ddl.sql.

If you don't yet have an e4 account, you can get one for free at https://provisioning.demo.globalgatewaye4.firstdata.com/signup. Then go to your [terminals](https://demo.globalgatewaye4.firstdata.com/terminal) and click on the ecommerce one. In the details:

* Enter `abc` into the Transarmor Token field (to enable tokenization)
* Click `Generate` next to the password field and save the password
* Click `Update`

The login to use for this plugin is your Gateway ID and the password is the auto-generated one.

Configuration
-------------

The plugin expects a `firstdata_e4.yml` configuration file containing the following:

```
:firstdata_e4:
  :login: login
  :password: password
  :test: true

:database:
  :adapter: sqlite3
  :database: test.db
# For MySQL
#  :adapter: 'jdbcmysql'
#  :username: 'killbill'
#  :password: 'killbill'
#  :driver: 'com.mysql.jdbc.Driver'
#  :url: 'jdbc:mysql://127.0.0.1:3306/killbill'
# In Kill Bill
#  :adapter: 'jdbcmysql'
#  :jndi: 'killbill/osgi/jdbc'
#  :connection_alive_sql: 'select 1'
#  :pool: 250
```

By default, the plugin will look at the plugin directory root (where `killbill.properties` is located) to find this file.
Alternatively, set the Kill Bill system property `-Dorg.killbill.billing.osgi.bundles.jruby.conf.dir=/my/directory` to specify another location.
