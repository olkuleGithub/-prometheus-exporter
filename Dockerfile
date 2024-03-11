# Use Python 3.9 as base image
FROM python:3.9-slim

# Set working directory in the container
WORKDIR /app

# Copy the Python script to the container
COPY exporter.py /app/exporter.py

# Install required Python packages
RUN pip install prometheus-client requests

# Expose port 8000 for Prometheus metrics
EXPOSE 8000

# Command to run the exporter script
CMD ["python", "exporter.py"]

