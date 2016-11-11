# Build the package

`swift build`

# Start the server

`.build/debug/swiftalps-blog`

Browse to it locally: `http://localhost:8090`

# Create a new post:

```
curl -d '{"title":"Awesome title","text":"Even better content"}' http://localhost:8090/posts`
```

# Endpoints

```
GET /posts
GET /posts/:id
POST /posts
```
