var MongoClient = require('mongodb').MongoClient;

const url = 'mongodb://localhost:27017';

MongoClient.connect(url, function(err, client) {
  if(err) {
	  return console.dir(err);
  }
  else {
      console.log("Connected successfully to server");
	  client.close();
  }
});