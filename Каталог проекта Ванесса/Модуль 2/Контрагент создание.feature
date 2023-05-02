﻿#language: ru

@tree

Функционал: проверка контрагента

Как Пользователь  я хочу
создать контрагента
чтобы  проверить его код  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание контрагента

* открыть карточку контраента
	И В командном интерфейсе я выбираю 'Закупки' 'Контрагенты'
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	
* заполнитьшабку
	Когда открылось окно 'Контрагент (создание)'
	И в поле с именем 'Наименование' я ввожу текст 'Тестовое имя'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Закупочная'
	
* заполнить адрес/телефон

	И в поле с именем 'Город' я ввожу текст 'Москва'
	
* записать
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	
* проверить код
И я запоминаю значение поля "Код" как "Код"
//И Я запоминаю значение поля "Код" значение "Код"
* записываю и закрываю
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Тестовое имя (Контрагент)' в течение 20 секунд
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я активизирую поле с именем "Код"
* проверяю код
	Тогда таблица "Список" содержит строки:
		| 'Код'       |
		| '$Код$' |
	
	
	

