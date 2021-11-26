use testdb

db.createUser(
  {
    user: "sam",
    pwd: "1234",
    roles: [
       { role: "read", db: "reporting" },
       { role: "read", db: "products" },
       { role: "read", db: "sales" },
       { role: "readWrite", db: "accounts" }
    ]
  }
)

db.shop.insertOne(
  {
      item: "phone",
	  details:
	  {
		  manufacturer: "Samsung",
		  model: "A51",
		  price: "699"
	  }
  }
)

db.shop.insertOne(
  {
      item: "phone",
	  details:
	  {
		  manufacturer: "HTC",
		  model: "Desire 20 pro",
		  price: "499"
	  }
  }
)