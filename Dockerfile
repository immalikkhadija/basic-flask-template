FROM python:3.11-slim

# Prevents Python from writing .pyc files and buffers stdout (better for logs)
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Install dependencies first so Docker can cache this layer
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app (app.py, templates/, etc.)
COPY . .

EXPOSE 5000

# Production-style start using gunicorn (add gunicorn to requirements.txt if not already there)
CMD ["python", "app.py"]
