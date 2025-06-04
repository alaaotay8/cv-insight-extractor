FROM python:3.11-slim

# Install tesseract
RUN apt-get update && \
    apt-get install -y tesseract-ocr && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

CMD ["uvicorn", "your_module.main:app", "--host", "0.0.0.0", "--port", "10000"]
