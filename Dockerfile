# Usa imagen base ligera
FROM python:3.11-slim

# Define el directorio de trabajo
WORKDIR /app

# Copia archivos
COPY . /app

# Instala dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Expone puerto 8080 (requerido por Cloud Run)
EXPOSE 8080

# Comando de inicio
CMD ["python", "app/main.py"]