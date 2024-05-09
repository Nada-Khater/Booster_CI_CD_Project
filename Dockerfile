FROM python:3.6-slim

# Set working dir in container
WORKDIR /app

# Copy requirements to working dir
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy Django project files to working dir
COPY . .

# Expose port 8000 to allow communication to app
EXPOSE 8000

# Run database migrations
RUN python manage.py makemigrations && python manage.py migrate

# Start Django server
CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]
