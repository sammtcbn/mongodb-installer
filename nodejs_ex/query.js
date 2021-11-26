const url = 'mongodb://localhost:27017/';
const dbName = 'testdb';

var MongoClient = require('mongodb').MongoClient;

MongoClient.connect(url, function(err, client) {
  if(err) {
	  return console.log(err);
  }
  else {
      console.log("Connected successfully to server");
	  const mydb = client.db(dbName);
	  mydb.collection("shop").find({}).toArray(function(err, result) {
         if (err)
             throw err;
         console.log(result);
         client.close();
      });
  }
});