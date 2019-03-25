## MongoDB
### MongoDB tools

#### BSON backups
`mongodump -h example.com:27017 -d MyDb -c MyCol -u username -p "password" -o /backup/mongodump-2013-10-24` - dump database or collection  
`mongorestore -h example.com:27017 -d MyDb -c MyCol` - restore dumped  

#### JSON backups
`mongoimport -d MyDb -c MyCol ` - import as JSON


### Mongo Query Language(MQL)

##### Aggregate, count group size, sort by descending, remove _id field and save result into MyCol collection
```javascript
db.getCollection('Documents').aggregate([
    {
        $group : {
            _id : {
                DocumentDate : "$DocumentDate",
                Bik : "$BankCode",
                Account : "$AccountNumber"
            },
            count : {$sum : 1}
        }
    },
    {$sort : {count : -1} },
    {
        $project : {
            _id : 0,
            _id : "$_id.DocumentDate",
            Bik : "$_id.Bik",
            Account : "$_id.Account",
            
        }
    },
    {$out : "MyCol"}
], {allowDiskUse : true})
```