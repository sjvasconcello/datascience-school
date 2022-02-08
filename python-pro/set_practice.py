set1 = {3, 4, 5}
set2 = {5, 6, 7}

set3 = set1 & set2  # Intersection

set4 = set1 - set2

set5 = set2 - set1

set6 = set1 ^ set2

if __name__ == '__main__':
    print("Insersecccion: ", set3)
    print("Diferencia: ", set4)
    print("Diferencia: ", set5)
    print("Diferencia simetrica: ", set6)