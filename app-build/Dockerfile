FROM python:2.7-slim

WORKDIR /app

RUN pip install --upgrade pip &&  pip install --no-cache-dir Flask==0.12.4

COPY . .

EXPOSE 8080

CMD ["python", "app.py"]
