import mysql.connector
from mysql.connector import Error

def ejecutar_consulta():
    try:
        # Conectar a la base de datos. Usamos "mysql" como host (nombre del servicio en docker-compose)
        connection = mysql.connector.connect(
            host='mysql',
            port=3306,
            database='access_logs_db',
            user='root',
            password='example'
        )

        if connection.is_connected():
            cursor = connection.cursor()
            query = """
            SELECT ip_address, COUNT(*) AS failed_attempts
            FROM access_logs
            WHERE result = 'failed'
              AND timestamp >= NOW() - INTERVAL 30 MINUTE
            GROUP BY ip_address
            HAVING failed_attempts > 5;
            """
            cursor.execute(query)
            results = cursor.fetchall()
            print("IPs con múltiples intentos fallidos:")
            for row in results:
                print(f"IP: {row[0]}, Intentos fallidos: {row[1]}")
    except Error as e:
        print("Error al conectar a MySQL:", e)
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == '__main__':
    ejecutar_consulta()
