import datetime

my_time = datetime.datetime.utcnow()

if __name__ == '__main__':

    my_str = my_time.strftime('%d/%m/%Y')
    print(f"Formato LATAM: {my_str}")
    
    my_str = my_time.strftime('%m/%d/%Y')
    print(f"Formato USA: {my_str}")
    
    my_str = my_time.strftime('Estamos en el año %Y')
    print(f"Formato RANDOM: {my_str}")