import time
from prometheus_client import start_http_server, Gauge
import requests

# Create a gauge metric
bitcoin_price_metric = Gauge('bitcoin_price', 'Current price of Bitcoin in USD')

def fetch_bitcoin_price():
    try:
        print("Fetching Bitcoin price...")  
        response = requests.get('https://api.coindesk.com/v1/bpi/currentprice.json')
        data = response.json()
        bitcoin_price = data['bpi']['USD']['rate_float']
        print(f"Bitcoin price fetched: {bitcoin_price}")  
        return bitcoin_price
    except Exception as e:
        print(f"Error fetching Bitcoin price: {e}")  
        return None

def update_metrics():
    bitcoin_price = fetch_bitcoin_price()
    if bitcoin_price is not None:
        bitcoin_price_metric.set(bitcoin_price)
        print("Metrics updated successfully")  

if __name__ == '__main__':
    print("Starting Prometheus server...")  
    # Start the Prometheus server on port 8000
    start_http_server(8000)
    print("Prometheus server started successfully")  
    # Update metrics every 30 seconds
    while True:
        update_metrics()
        print("Waiting for 30 seconds before updating metrics again...") 
        time.sleep(30)
