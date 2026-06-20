# Use an official lightweight Python image
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Copy requirements framework specifications first to leverage caching layers
COPY requirements.txt .

# Install dependencies cleanly
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application source code into the image container
COPY . .

# Expose production port
EXPOSE 8080

# Environment variable configuration for production Flask systems
ENV PORT=8080
ENV FLASK_APP=service:app

# Command to run the application using a production WSGI server
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "service:app"]
