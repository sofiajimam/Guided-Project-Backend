# Ticketing System Backend

This is the backend component of a ticketing system, built using Ruby on Rails and GraphQL. The backend is responsible for handling data requests from the frontend components (web app and mobile app) and interfacing with the database.

## Requirements

- Ruby 3.2.1
- Rails 7.0.4
- GraphQL
- PostgreSQL

## Installation

1. Clone the repository: `git clone https://github.com/sofiajimam/Guided-Project-Backend.git`
2. Install dependencies: `bundle install`
3. Setup the database: `rails db:create db:migrate`
4. Start the server: `rails s`

## Usage

The backend provides a GraphQL API for handling data requests. The API is available at `http://localhost:3000/graphql`. To access the API, you can use a tool such as [GraphiQL](https://github.com/graphql/graphiql) or [Insomnia](https://insomnia.rest/download).
