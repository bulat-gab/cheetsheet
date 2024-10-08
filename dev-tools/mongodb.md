## MongoDB

### MongoDB tools

`mongo --shell uuidhelpers.js` - load helper functions

#### BSON backups

`mongodump -h example.com:27017 -d MyDb -c MyCol -u username -p "password" -o /backup/mongodump-2013-10-24` - dump database or collection  
`mongorestore -h example.com:27017 -d MyDb -c MyCol` - restore dumped

#### JSON backups

`mongoimport -d MyDb -c MyCol --file fileName.json` - import as JSON

### Mongo Query Language(MQL)

##### Aggregate, count group size, sort by descending, remove \_id field and save result into MyCol collection

```javascript
db.getCollection("Documents").aggregate(
  [
    {
      $group: {
        _id: {
          DocumentDate: "$DocumentDate",
          Bik: "$BankCode",
          Account: "$AccountNumber",
        },
        count: { $sum: 1 },
      },
    },
    { $sort: { count: -1 } },
    {
      $project: {
        _id: 0,
        _id: "$_id.DocumentDate",
        Bik: "$_id.Bik",
        Account: "$_id.Account",
      },
    },
    { $out: "MyCol" },
  ],
  { allowDiskUse: true }
);
```

##### Drop dbs that start with 'Test'

```javascript
var mongo = db.getMongo();
mongo
  .getDBNames()
  .filter(
    (n) => n != "admin" && n != "local" && n != "config" && n.startsWith("Test")
  )
  .forEach((dbName) => {
    var db = mongo.getDB(dbName);
    db.dropDatabase();
  });
```

##### Find NOT empty array

```javasript
ME.find({ pictures: { $exists: true, $ne: [] } })
```
