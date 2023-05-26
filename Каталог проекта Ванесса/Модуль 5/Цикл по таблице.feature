﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Изменение количества во всех строках

* откроем
	
	
* перебор
	И для каждой строки таблицы "ItemList" я выполняю используя колонку "N"
		И в таблице "ItemList" в поле "Количество" я ввожу текст "1002"    // обязательно сдвинуть на один шаг 
		

Сценарий: Удалить все строки 		
	И пока в таблице "ItemList" количество строк ">" 0 Тогда
		И в таблице "ItemList" я удаляю строку
		

Сценарий: Замена поля таблицы
И для каждой строки таблицы "ItemList" я выполняю
	Если  таблица "ItemList" содержит строки Тогда:
			| 'Номенклатура'            | 'Характеристика'          | 'Вид цены'          |
			| 'Товар без характеристик' | 'Товар без характеристик' | 'Ручное назначение' |
			| 'Товар без характеристик' | 'Товар без характеристик' | 'Ручное назначение' |
			| 'Товар без характеристик' | 'Товар без характеристик' | 'Ручное назначение' |
			| 'Товар без характеристик' | 'Товар без характеристик' | 'Ручное назначение' |

//			Когда открылось окно 'Поступление товаров и услуг * от *'
//			И в таблице "ItemList" я активизирую поле с именем "ItemListPriceType"
			И в таблице "ItemList" я перехожу к строке
				| 'Номенклатура'            | 'Характеристика'          | 'Вид цены'          |
				| 'Товар без характеристик' | 'Товар без характеристик' | 'Ручное назначение' |
			И в таблице "ItemList" я выбираю текущую строку
			И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListPriceType"
//			Тогда открылось окно 'Виды цен'
			И в таблице "List" я перехожу к строке:
				| 'Валюта' | 'Код' | 'Наименование'      | 'Ссылка'            |
				| 'USD'    | '3'   | 'Цена поставщика 1' | 'Цена поставщика 1' |
//			И в таблице "List" я активизирую поле с именем "Description"
			И в таблице "List" я выбираю текущую строку
* проверим все ли ок. ВАЖНО лесницу правильно сделать
И таблица  "ItemList" не содержит строки:
		| 'Номенклатура'            | 'Характеристика'          | 'Вид цены'          |
		| 'Товар без характеристик' | 'Товар без характеристик' | 'Ручное назначение' |
			
Сценарий: перебор элеменов справочника Номенклатура
	И для каждой строки таблицы "List" я выполняю
		И в таблице "List" я выбираю текущую строку
		Тогда не появилось окно предупреждения системы
		И я закрываю текущее окно

Сценарий: Отрытие большого количества элементов		
	И Я запоминаю значение выражения '1' в переменную "ЧастьИмени"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$ЧастьИмени$ + 1' в переменную "ЧастьИмени"
		И Я запоминаю значение выражения '"ед.изм. " + $ЧастьИмени$'  в переменную "ИмяЕденицыИзмерения"
//		* подготовка и загрузка данных //выражение для генерирования уникальной ссылки
		И я проверяю или создаю для справочника "Units" объекты:  
			| 'Ref'                                                           | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit' | 'UOM' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
			| '{"e1cib/data/Catalog.Units?ref=" + StrReplace(NEW UUID, "-", "")}' | 'False'        |       | ''     | 1          | ''          | ''    | '$ИмяЕденицыИзмерения$'             | ''                 | ''               | ''               |          |          |          |          |         |
