# API Documentations

## Sign up user

	POST /api/users 
	
	{"user" : { "name" : "user name", "email": "user email", "password": "password" } }
	
	Response
	
	{ "id" : 1, "name": "user name", "api_key": "must save api_key" }
	
	Example
	
	curl -XPOST -H 'Content-Type: application/json' -d '{"user": {"name": "Ismail", "email": "rubyonrails3@gmail.com", password: "password" }}' example.com/api/users 
	
	
## Create Tweet

	POST /api/tweets 
	
	params
	
	{"tweet": { "content": "This is my tweet" } }
	
	Header
	
	Authorization: Token token=your_api_key
	
	Response
	
	{ "id": 1, "content": "This is my tweet", "user": {"id": 1, "name": "username", "email": "email address" } }
	
	
## Create friendship

	POST /api/friendships
	
	params
	
	{ "friendship": { "email" : "email of an exisitng user " } }
	
	Headers
	
	Authorization: Token token=your_api_key
	
	Response
	
	{ "id": 1, "created_at": "time", "friend": { "id": 2, name: "friend name", "email": "friend email" } }
	
	
## Remove friendship

	DELETE /api/friendships
	
	params
	
	{ "email" : "existing friend email address" }
	
	Headers
	
	Authorization: Token token=your_api_key
	
	Response
	
	
	Example
	
	curl -XDELETE -d '{"email": "rubyonrails3@gmail.com"}' -H 'Content-Type: application/json' -H 'Authorization: Token token=N5gPBXzAAZWUycYZqZu0D1m5yHUV+0KF' example.com/api/friendships 
	

## Feeds
	
	GET /api/feeds
	
	Headers
	
	Authorization: Token token=your_api_key

	Response
	
	{ "feeds" [{"id": 1, "content": "this is my tweet", "created_at": "time", "user": {"id": 1, "name": "user name", "email": "email address", "is_owner": "boolean if you tweeted item"} }] }
	
## Friends

	GET /api/friends
	
	Headers 
	
	Authorization: Token token=your_api_key
	
	Response
	
	{"friends": [{"id": 1, "name": "name", "email": "user email", "created_at": "time"}] }
	
