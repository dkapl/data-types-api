### API Exercise

#### Setup

Make sure you have rails installed

Then pull down application
```
git clone https:://github.com/dkapl/rest-data-types && cd rest-data-types
bundle install
```

To run tests, run `bundle exec rspec` from the root of the project. 

To start the server, run 'rails server'. You can then CURL against `http://localhost:3000/` or visit `http://localhost:3000/` in the browser. 


In Ruby, please develop a small REST API that yields results of simple calculations and data lookups. 


#### REST API specifications in swagger doc


```text
swagger: '2.0'
info:
  title: Data Item API
  version: "1.0.0"
host: data.calculator.com
schemes:
  - https
basePath: /v1
produces:
  - application/json
paths:
  /data-items/{type}:
    get:
      summary: Get annual results based on data-item type
      parameters:
        - name: type
          in: path
          description: The calculation type (alpha, beta, gamma)
          required: true
          type: string
        - name: company_id
          in: query
          description: Company numeric identifier
          required: true
          type: number
          format: integer
      responses:
        200:
          description: An array of data items
          schema:
            type: array
            items:
              $ref: '#/definitions/DataItem'
 
definitions:
  DataItem:
    type: object
    properties:
      year:
        type: number
        format: integer
      value:
        type: number
        format: double

```


