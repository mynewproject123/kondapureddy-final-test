# Use official Python image
FROM python:3.10-slim

# Set workdir
WORKDIR /app

# Copy files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Expose port
EXPOSE 5000

# Start the app using gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
