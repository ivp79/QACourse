﻿#language: ru

@tree

Функционал: Заказ

Как Менеджер по продажам я хочу
расчитать заказ по номенклатуре 
чтобы сообщить клиенту суммц заказа    

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
Сценарий: Проверка расчета табличной части
*Отркытие формы заказа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И в таблице "Список" я перехожу к строке:
		| 'Автор'                | 'Валюта взаиморасчетов' | 'Вид цен' | 'Дата'                | 'Номер'     | 'Организация'        | 'Покупатель'         | 'Склад' | 'Состояние заказа' |
		| 'Менеджер по продажам' | 'Рубли'                 | 'Оптовая' | '09.11.2022 21:33:50' | '000000008' | 'ООО "Все для дома"' | 'Магазин "Продукты"' | 'Малый' | 'Закрыт'           |
	И в таблице "Список" я активизирую поле с именем "Организация"
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ * от *'
*Редактирование строки
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '20'
	И в таблице "Товары" я завершаю редактирование строки
*Проверка редактирования строки
	Тогда таблица "Товары" стала равной:
		| 'Товар'  | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Йогурт' | '100,00' | '20'         | '2 000,00' |
*Закрытия формы	
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ * от * *' в течение 20 секунд