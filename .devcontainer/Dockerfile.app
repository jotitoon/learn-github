# Dockerfile.app
FROM python:3.9

# Actualiza el listado de paquetes e instala el cliente MySQL
RUN apt-get update && apt-get install -y default-mysql-client

# Instala la dependencia de Python
RUN pip install mysql-connector-python

# Define el directorio de trabajo
WORKDIR /workspace

# Mantiene el contenedor en ejecución para que VS Code se conecte
CMD ["tail", "-f", "/dev/null"]
