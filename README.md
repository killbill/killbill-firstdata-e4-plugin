killbill-firstdata-e4-plugin
============================

Plugin to use [First Data Global Gateway e4](http://www.firstdata.com/ecommerce/) as a gateway.

Release builds are available on [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.kill-bill.billing.plugin.ruby%22%20AND%20a%3A%22firstdata-e4-plugin%22) with coordinates `org.kill-bill.billing.plugin.ruby:firstdata-e4-plugin`.

Kill Bill compatibility
-----------------------

| Plugin version | Kill Bill version |
| -------------: | ----------------: |
| 0.1.y          | 0.16.z            |
| 0.2.y          | 0.18.z            |

Requirements
------------

The plugin needs a database. The latest version of the schema can be found [here](https://github.com/killbill/killbill-firstdata-e4-plugin/blob/master/db/ddl.sql).

Configuration
-------------

```
curl -v \
     -X POST \
     -u admin:password \
     -H 'X-Killbill-ApiKey: bob' \
     -H 'X-Killbill-ApiSecret: lazar' \
     -H 'X-Killbill-CreatedBy: admin' \
     -H 'Content-Type: text/plain' \
     -d ':firstdata_e4:
  :login: "your-login"
  :password: "your-password"' \
     http://127.0.0.1:8080/1.0/kb/tenants/uploadPluginConfig/killbill-firstdata-e4
```

To get your credentials:

1. Go to [provisioning.demo.globalgatewaye4.firstdata.com/signup](https://provisioning.demo.globalgatewaye4.firstdata.com/signup) and create an account.
2. Go to your [terminals](https://demo.globalgatewaye4.firstdata.com/terminal) and click on the ecommerce one. In the details:
 * Enter `abc` into the Transarmor Token field (to enable tokenization)
 * Click `Generate` next to the password field and save the password
 * Click `Update`

The login to use for this plugin is your Gateway ID and the password is the auto-generated one.

To go to production, create a `firstdata_e4.yml` configuration file under `/var/tmp/bundles/plugins/ruby/killbill-firstdata-e4/x.y.z/` containing the following:

```
:firstdata_e4:
  :test: false
```

Usage
-----

To store a credit card:

```
curl -v \
     -X POST \
     -u admin:password \
     -H 'X-Killbill-ApiKey: bob' \
     -H 'X-Killbill-ApiSecret: lazar' \
     -H 'X-Killbill-CreatedBy: admin' \
     -H 'Content-Type: application/json' \
     -d '{
       "pluginName": "killbill-firstdata-e4",
       "pluginInfo": {
         "properties": [
           {
             "key": "ccFirstName",
             "value": "John"
           },
           {
             "key": "ccLastName",
             "value": "Doe"
           },
           {
             "key": "address1",
             "value": "5th Street"
           },
           {
             "key": "city",
             "value": "San Francisco"
           },
           {
             "key": "zip",
             "value": "94111"
           },
           {
             "key": "state",
             "value": "CA"
           },
           {
             "key": "country",
             "value": "USA"
           },
           {
             "key": "ccExpirationMonth",
             "value": 12
           },
           {
             "key": "ccExpirationYear",
             "value": 2017
           },
           {
             "key": "ccNumber",
             "value": "4111111111111111"
           }
         ]
       }
     }' \
     "http://127.0.0.1:8080/1.0/kb/accounts/2a55045a-ce1d-4344-942d-b825536328f9/paymentMethods?isDefault=true"
```
