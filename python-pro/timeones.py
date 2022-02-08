from datetime import datetime
import pytz

santiago_timezone = pytz.timezone("America/Santiago")
santiago_date = datetime.now(santiago_timezone)


mexico_timezone = pytz.timezone("America/Mexico_City")
mexico_date = datetime.now(mexico_timezone)


bogota_timezone = pytz.timezone("America/Caracas")
bogota_date = datetime.now(bogota_timezone)


if __name__ == '__main__':
    print("Santiago: ", santiago_date.strftime("%d/%m/%Y, %H:%M:%S"))
    print("Ciudad de mexico: ", mexico_date.strftime("%d/%m/%Y, %H:%M:%S"))
    print("Bogota: ", bogota_date.strftime("%d/%m/%Y, %H:%M:%S"))

