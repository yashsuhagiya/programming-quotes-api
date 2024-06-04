# Programming Quotes API

**Programming Quotes API for open source projects.**

Status: [currently without free hosting](https://github.com/mudroljub/programming-quotes-api/issues/54).

## Introduction

This open source API provides a large collection of programming quotes and their authors. These can be searched and favoured. This allows the citations to be filtered according to personal preferences. Quotes can also be edited, created and deleted. 

Convention: The names of the authors are as on Wikipedia.

## Development

Start the project locally:

```
dotnet build
dotnet watch run
```

Listening on: http://localhost:5000 and https://localhost:5001

## API Documentation

GET `/quotes` (get all quotes)

GET `/quotes/random` (get random quote)

GET `/quotes/5a6ce86f2af929789500e824` (get quote by id)

GET `/quotes/author/Edsger W. Dijkstra` (get quote by author)

You can also POST, PUT, PATCH and DELETE. See Swagger docs for more.

## Author info

You can use Wikipedia API for author's image and info. 

To get author's image:

[`https://en.wikipedia.org/w/api.php?action=query&titles=Fred%20Brooks&prop=pageimages&format=json&pithumbsize=250`](https://en.wikipedia.org/w/api.php?action=query&titles=Fred%20Brooks&prop=pageimages&format=json&pithumbsize=250)

To get author info:

[`https://en.wikipedia.org/w/api.php?action=query&titles=Fred%20Brooks&prop=extracts&format=json&exintro=1`](https://en.wikipedia.org/w/api.php?action=query&titles=Fred%20Brooks&prop=extracts&format=json&exintro=1)

Note that you can change `titles`, `pithumbsize` and other params. The `%20` character (as in `Fred%20Brooks`) is for empty space.

## TODO

- remove Helpers, move settings to env
- deploy on some free server?
