# README

Test Latest stock price api

## Postman Collection

To help with testing and understanding the API, we have included a Postman collection that you can use to make requests to the API endpoints.

### What's Included

The Postman collection includes:
- **All API endpoints**: Detailed requests for every available endpoint.
- **Environment setup**: Pre-configured environment variables for ease of testing.

### How to Use the Postman Collection

1. **Download the Collection**:
   - The Postman collection is available in the repository at [`Test-API.postman_collection.json`](
   - You can download the file directly or clone this repository to get the latest version.

2. **Import the Collection into Postman**:
   - Open Postman.
   - Click on the `Import` button in the top-left corner.
   - Select the `File` tab and choose the `.json` file from your local machine.
   - The collection will appear in your Postman under "Collections".

### Example Usage

  1. **To test sign in `GET /api/v1/login?email=user@example.com&password=password` endpoint:**
   - Select the `SIGN IN` request in the Postman collection.
   - Ensure your Rails server is running locally or on a specific host.
   - Click `Send` to execute the request and view the response.

  2. **To test Get Price ALL `GET api/v1/price_all` endpoint:**
   - Select the `PRICE ALL` request in the Postman collection.
   - Ensure your Rails server is running locally or on a specific host.
   - Ensure send your Token from Header
   - Click `Send` to execute the request and view the response.

  3. **To test Get Price `GET /api/v1/price?symbol=BAJFINANCE` endpoint:**
   - Select the `PRICE` request in the Postman collection.
   - Ensure your Rails server is running locally or on a specific host.
   - Ensure send your Token from Header
   - Click `Send` to execute the request and view the response.

  4. **To test Get Prices `GET /api/v1/prices?symbol=BAJFINANCE,HDFCBANK` endpoint:**
   - Select the `PRICES` request in the Postman collection.
   - Ensure your Rails server is running locally or on a specific host.
   - Ensure send your Token from Header
   - Click `Send` to execute the request and view the response.


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# test-latest-stock-price-api
