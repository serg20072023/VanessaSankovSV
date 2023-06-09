﻿#language: ru

@tree

Функционал: Проверка документа и его проводок РаходТовара
//
//Как <Роль> я хочу
//<описание функционала> 
//чтобы <бизнес-эффект>

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка заполнения полей документа
И я закрываю все окна клиентского приложения
* заполнение шапки 
	Когда В панели разделов я выбираю 'Товарные запасы'
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
//	Тогда открылось окно 'Продажи товара'
	И я нажимаю на кнопку 'Создать'
//	Тогда открылось окно 'Продажа товара (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
//	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'           |
		| '000000016' | 'Магазин "Мясная лавка"' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Продажа товара (создание) *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Средний'
	И из выпадающего списка "Вид цен" я выбираю точное значение 'Оптовая'
	И из выпадающего списка "Валюта взиморасчетов" я выбираю точное значение 'Руб'
	* проверим разные варианты заполнения шапки 
		* типовой
//			Когда открылось окно 'Продажа товара (создание) *'
			И я нажимаю кнопку выбора у поля с именем "Покупатель"
			Тогда открылось окно 'Контрагенты'
			И в таблице "Список" я перехожу к строке:
				| 'Код'       | 'Наименование'              |
				| '000000014' | 'Магазин "Бытовая техника"' |
			И в таблице "Список" я выбираю текущую строку
			И элемент формы 'Вид цен' стал равен 'Розничная'
		* с заполнением типа цены
//			Когда открылось окно 'Продажа * от * *'
			И я нажимаю кнопку выбора у поля с именем "Покупатель"
			И в таблице "Список" я перехожу к строке:
				| 'Код'       | 'Наименование'           |
				| '000000016' | 'Магазин "Мясная лавка"' |
			И в таблице "Список" я выбираю текущую строку
			И элемент формы 'Вид цен' стал равен 'Закупочная'
		* проверяем видимость поля Валютва при смене организауии
//			Когда открылось окно 'Продажа товара (создание) *'
			И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары"'
			И элемент формы с именем "Валюта" присутствует на форме
			И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
			И элемент формы "Валюта взиморасчетов" отсутствует на форме

												
*Заполним товары таблицу и проверить 
	* заполним товары 
	//	Когда открылось окно 'Продажа товара (создание) *'
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита "Товар"
	//	Тогда открылось окно 'Товары'
		И я нажимаю на кнопку 'Список'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Сапоги'       |
		И в таблице "Список" я выбираю текущую строку
	//	Тогда открылось окно 'Продажа товара (создание) *'
		И в таблице "Товары" я активизирую поле "Цена"
		И в таблице "Товары" в поле 'Цена' я ввожу текст '1,00'
		И в таблице "Товары" я активизирую поле "Количество"
		И в таблице "Товары" я завершаю редактирование строки
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита "Товар"
		И я нажимаю на кнопку 'Список'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Туфли'        |
		И в таблице "Список" я выбираю текущую строку
	//	Тогда открылось окно 'Продажа товара (создание) *'
		И в таблице "Товары" я активизирую поле "Цена"
		И в таблице "Товары" в поле 'Цена' я ввожу текст '10,00'
		И в таблице "Товары" я активизирую поле "Количество"
		И в таблице "Товары" в поле 'Количество' я ввожу текст '2,00'
		И в таблице "Товары" я завершаю редактирование строки
		
	* проверим заполнение таьлицы
		Тогда таблица "Товары" стала равной:
			| 'N' | 'Товар'  | 'Цена'  | 'Количество' | 'Сумма' |
			| '1' | 'Сапоги' | '1,00'  | '1,00'       | '1,00'  |
			| '2' | 'Туфли'  | '10,00' | '2,00'       | '20,00' |
		
		И элемент формы с именем 'ТоварыИтогКоличество' стал равен '3'
		И элемент формы с именем 'ТоварыИтогСумма' стал равен '21'
	* поменяем количество и цену  и проверим 
		И в таблице "Товары" я перехожу к строке:
			| 'N' | 'Количество' | 'Сумма' | 'Товар'  | 'Цена' |
			| '1' | '1,00'       | '1,00'  | 'Сапоги' | '1,00' |
		И в таблице "Товары" я активизирую поле "Цена"
		И в таблице "Товары" в поле 'Цена' я ввожу текст '30,00'
		И в таблице "Товары" я перехожу к строке:
			| 'Товар'  |
			| 'Туфли' |
		И в таблице "Товары" я активизирую поле "Количество"
		И в таблице "Товары" в поле 'Количество' я ввожу текст '3,00'
		Тогда таблица "Товары" стала равной:
			| 'N' | 'Товар'  | 'Цена'  | 'Количество' | 'Сумма' |
			| '1' | 'Сапоги' | '30,00' | '1,00'       | '30,00' |
			| '2' | 'Туфли'  | '10,00' | '3,00'       | '30,00' |
	
		
		И элемент формы с именем 'ТоварыИтогКоличество' стал равен '4'
		И элемент формы с именем 'ТоварыИтогСумма' стал равен '60'

* запишим документ и провериv его наличие в таблице  и что он проведен 
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля "Номер" как "$$$$НомерДок$$$$"
	И я нажимаю на кнопку с именем 'ФормаПровести'
	И я получаю состояние текущего объекта (Расширение)
	Тогда переменная "Проведен" имеет значение "{Истина}"
//	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я закрываю все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	Тогда таблица "Список" содержит строки:
		| 'Номер'        |
		| '$$НомерДок$$' |
	И в таблице "Список" я выбираю текущую строку


Сценарий: Проверка движений по регистрам 
	Дано Я открываю навигационную ссылку "e1cib/list/ЖурналДокументов.ДокументыПродаж"
	Когда открылось окно 'Документы продаж'
	И в таблице "Список" я перехожу к строке:
		| 'Номер'     |
		| '$$НомерДок$$' |
	И в таблице "Список" я выбираю текущую строку
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
	Тогда таблица "Список" стала равной по шаблону:
		| 'Период'              | 'Регистратор'                              | 'Номер строки' | 'Контрагент'             | 'Сумма' | 'Валюта' |
		| '*' | 'Продажа * от *' | '1'            | 'Магазин "Мясная лавка"' | '60,00' | 'Руб'    |
	
	//	Когда открылось окно 'Продажа * от *'
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
	Тогда таблица "Список" стала равной по шаблону:
		| 'Период'              | 'Регистратор'                              | 'Номер строки' | 'Покупатель'             | 'Товар'  | 'Количество' | 'Сумма' |
		| '*' | 'Продажа * от *' | '1'            | 'Магазин "Мясная лавка"' | 'Сапоги' | '1,00'       | '30,00' |
		| '*' | 'Продажа * от *' | '2'            | 'Магазин "Мясная лавка"' | 'Туфли'  | '3,00'       | '30,00' |
	
	

//	Когда открылось окно 'Продажа * от *'
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'

	Тогда таблица "Список" стала равной по шаблону:
		| 'Период'              | 'Регистратор'                              | 'Номер строки' | 'Товар'  | 'Склад'   | 'Количество' |
		| '*' | 'Продажа * от *' | '1'            | 'Сапоги' | 'Средний' | '1,00'       |
		| '*' | 'Продажа * от *' | '2'            | 'Туфли'  | 'Средний' | '3,00'       |
	
		
Сценарий: проверка печатных форм
	Дано Я открываю навигационную ссылку "e1cib/list/ЖурналДокументов.ДокументыПродаж"
	Когда открылось окно 'Документы продаж'
	И в таблице "Список" я перехожу к строке:
		| 'Номер'     |
		| '$$НомерДок$$' |
	И в таблице "Список" я выбираю текущую строку
	Когда открылось окно 'Продажа * от *'
	И я нажимаю на кнопку 'Печать расходной накладной'
	Дано Табличный документ "SpreadsheetDocument" равен макету "МакетПечатьРасходнойНакладной" по шаблону
//	И область "R9C2:R11C5" табличного документа 'SpreadsheetDocument' равна макету "МакетПечатьРасходнойНакладной" по шаблону
	
	И Я закрываю окно 'Таблица'
	Когда открылось окно 'Продажа * от *'
	И я нажимаю на кнопку 'Доставка'
//	Дано Табличный документ "ТабличныйДокумент" равен макету "МакетДоставка" по шаблону
//	И область "R9C2:R11C5" табличного документа 'SpreadsheetDocument' равна макету "ИмяМакета"
	И в табличном документе 'ТабличныйДокумент' ячейка с адресом 'R5C2' равна 'Заявка на доставку товара'

	И я закрываю все окна клиентского приложения
