# Përdorni një imazh bazë të Python
FROM python:3.9-slim

# Instaloni gcc dhe ndihmësit e tjerë
RUN apt-get update && \
    apt-get install -y gcc g++ && \
    apt-get clean

# Kopjoni skedarin e kërkesave dhe instaloni paketat
COPY requirements.txt /app/
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt

# Kopjoni kodin e aplikacionit në kontejner
COPY . /app/

# Ekspozoni portin që do të përdoret nga aplikacioni
EXPOSE 5000

# Komanda për të nisur aplikacionin
CMD ["python", "main.py"]
