﻿#language: ru

@tree

Функционал: Проверка возможности прикрепления файла картинки в карточку Товара

Как Тестировщик я хочу
проверить возможность прикрепления файла картинки в карточке товара 
чтобы функционал работал без ошибок   

Переменные:
	ПеремНаименованиеТовара = 'Кирпич'

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: _001 Проверка возможности прикрепления файла картинки в карточку Товара
	* Создание Товара
		И Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
	* Заполнение реквизитов Товара
		И в поле с именем 'Наименование' я ввожу текст '$ПеремНаименованиеТовара$'
	* Запись товара
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я запоминаю значение поля "Код" как "$ПеремКод$"
	* Прикрепелние картинки	
		И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		И в поле с именем 'Наименование' я ввожу текст '$ПеремНаименованиеТовара$'
		И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
		И я выбираю файл '$КаталогПроекта$\FeaturesVA\Итоговое задание\Files\Кирпич.jpg'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И в таблице "Список" я перехожу к строке
			| 'Наименование'              |
			| '$ПеремНаименованиеТовара$' |
		И в таблице "Список" я выбираю текущую строку	
	* Запись товара с картинкой
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я запоминаю значение поля с именем "Картинка" как "$ПеремКартинка$"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'			
	* Проверка записанного товара с картинкой
		И таблица "Список" содержит строки:
			| 'Код'   |
			| '$ПеремКод$' |
	* Проверка открытия и заполнения товара с картинкой
		* Открытие товара
			И в таблице "Список" я перехожу к строке:
				| 'Код'   |
				| '$ПеремКод$' |	
			И в таблице "Список" я выбираю текущую строку
		* Проверка наименование и картинки 
			Тогда элемент формы "Наименование" стал равен "$ПеремНаименованиеТовара$"	
			И у элемента формы с именем "Картинка" текст редактирования стал равен '$ПеремКартинка$'
	* Закрытие всех окон
		И я закрываю все окна клиентского приложения				