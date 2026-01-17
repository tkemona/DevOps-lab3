FROM python:3.11 AS builder
WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app /app
FROM builder AS test
RUN pytest
FROM python:3.11-slim AS final
WORKDIR /app
COPY --from=builder /usr/local /usr/local
COPY --from=builder /app /app
CMD ["gunicorn", "-b", "0.0.0.0:5000", "src.main:app"]