def display_menu(menu):
    print("Меню:")
    for item, price in menu.items():
        print(f"{item}: {price} грн")


def add_new_item_to_menu(menu):
    while True:
        new_item = input("Введіть назву нового товару (або 'готово', щоб завершити): ")
        if new_item.lower() == 'готово':
            break
        price = float(input(f"Запропонуйте ціну за одиницю товару '{new_item}': "))
        menu[new_item] = price
    print("Оновлене меню кав'ярні:")
    display_menu(menu)


def place_order(menu):
    order = {}
    total_cost = 0
    
    while True:
        item = input("Введіть назву товару (або 'готово', щоб завершити замовлення): ")
        if item.lower() == 'готово':
            break

        if item not in menu:
            print("На жаль, цей товар відсутній у нашому меню.")
            add_item = input("Бажаєте додати його до меню? (так/ні): ")
            if add_item.lower() == 'так':
                price = float(input(f"Запропонуйте ціну за одиницю товару '{item}': "))
                menu[item] = price
            else:
                continue
        
        quantity = int(input(f"Введіть кількість '{item}': "))
        order[item] = quantity
        total_cost += menu[item] * quantity
    
    print("\nВаше замовлення:")
    for item, quantity in order.items():
        cost = menu[item] * quantity
        print(f"{item}: {quantity} шт. - {cost} грн")
    
    print(f"Загальна вартість замовлення: {total_cost} грн")

def main():
    menu = {
        "Еспресо": 25,
        "Капучіно": 35,
        "Латте": 40,
        "Американо": 30,
        "Какао": 35,
        "Чай": 25,
        "Шоколадне печиво": 10, 
        "Натуральна яблучна пастила": 20
    }

    display_menu(menu)
    while True:
        choice = input("\nВведіть 'замовлення' для оформлення замовлення, 'новеньке' для додавання нового товару, або 'готово' для виходу: ")
        if choice == 'замовлення':
            place_order(menu)
        elif choice == 'новеньке':
            add_new_item_to_menu(menu)
        elif choice.lower() == 'готово':
            break
        else:
            print("Неправильний ввід. Спробуйте ще раз.")


if __name__ == "__main__":
    main()