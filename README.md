# dart-postgres-example
Example project demonstrating how to build web APIs with [Dart](https://dart.dev), [Shelf](https://pub.dartlang.org/packages/shelf), and [PostgreSQL](https://postgresql.org).

## Introduction
This project is an implementation of a very simple REST API (and backing PostgreSQL database schema) that can create and list basic items via HTTP requests. Server port and database connection info are set via environment variables, allowing for easy deployment to app containers.

## Requirements
The following tools are required to run this project:
* [Dart](https://dart.dev/get-dart)
* [PostgreSQL](https://www.postgresql.org/download/)

## Getting Started
To run and test the server:
* Clone this repo and `cd` into its directory
* Initialize the database with `./db_create.sh`
* Run the server with `$ dart bin/server.dart`
* Create items with `$ curl -X POST localhost:9001/item -d '{"name":"test"}'`
* List items with `$ curl localhost:9001/items`

## Contribution
If you notice something out of place or in need of some improvements: issues, pull requests, and other contributions are welcome.

Thanks for checking out this project!
[@8_bit_hacker](https://twitter.com/8_bit_hacker)

___
Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
