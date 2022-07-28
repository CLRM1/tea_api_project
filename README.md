# README

The Tea API project is a take home challenge from the Turing School of Software and Design. It allows requests for creating, listing and cancelling tea subscriptions. 

## Setup
- `git clone`
- `cd tea_api_project`
- `bundle`
- `rails s`
- Make a request

## Requests

- POST localhost:3000/api/v1/subscriptions
- Body: 
- `{ "title": "Z Tea Company", "status": "cancelled", "frequency": "monthly", "tea_id": "1", "customer_id": "1" }`
- Response:
``` json
{
    "data": "Subscription created"
}

```


- PUT localhost:3000/api/v1/subscriptions
- Body: 
- `{ "title": "Z Tea Company", "status": "cancelled", "customer_id": "1" }`
- Response:
``` json
{
    "data": "Subscription cancelled"
}

```

- GET localhost:3000/api/v1/customers/1/subscriptions

- Response:
``` json
[
    {
        "id": 1,
        "title": "ABC Tea Company",
        "price": 20.5,
        "status": "active",
        "frequency": "monthly",
        "customer_id": 1,
        "tea_id": 1
    },
    {
        "id": 2,
        "title": "Z Tea Company",
        "price": 20.5,
        "status": "active",
        "frequency": "monthly",
        "customer_id": 1,
        "tea_id": 1
    }
]

```
## Schema

<img width="967" alt="Screen Shot 2022-07-25 at 3 27 45 PM" src="https://user-images.githubusercontent.com/26349568/180879396-8dc24c7b-4e45-4c70-94e3-38aea7ce0a20.png">
