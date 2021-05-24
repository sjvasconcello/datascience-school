
def run():
    my_list = [1, "Hello", True, 4.5]
    my_dict = {"fistname":"Facuando","lastname":"Garcia"}

    super_list = [
        {"fistname":"Facuando","lastname":"Garcia"},
        {"fistname":"Facuando","lastname":"Garcia"},
        {"fistname":"Facuando","lastname":"Garcia"}
    ]

    super_dict = {
        "natursl_nums": [1,2,3,4,5],
        "integer_nums": [-1,2,2,3,4],
        "floating_nums": [1.1, 3,4,5]
    }

    for key, value in super_dict.items():
        print(key, "-", value)

if __name__ == "__main__":
    run()