FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# System dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    libffi-dev \
    libssl-dev \
    libpq-dev \
    libjpeg-dev \
    zlib1g-dev \
    libpng-dev \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies (cached layer)
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip setuptools wheel \
    && pip install -r /app/requirements.txt

# Copy entrypoint and make executable
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Copy project files
COPY . .

EXPOSE 8000

ENTRYPOINT ["/app/entrypoint.sh"]
