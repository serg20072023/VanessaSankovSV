﻿#language: ru
@дерево
@ExportScenarios
@Модуль2Заказ
@tree
@IgnorOnCIMainBuild

Функционал: Заполнение шапки документа Заказ 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

* создаю документ
@ТипШага: Экпортные Сценарии
@Описание: Создание документа Заказ
@ПримерИспользования: И Создание документа Заказ
Сценарий: Создание документа Заказ
Когда В панели разделов я выбираю 'Закупки'
И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
Тогда открылось окно 'Заказы товаров'
И я нажимаю на кнопку с именем 'ФормаСоздать'
Когда открылось окно 'Заказ (создание)'
И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
Когда открылось окно 'Заказ (создание) *'
И я нажимаю кнопку выбора у поля с именем "Покупатель"
Тогда открылось окно 'Контрагенты'
И в таблице "Список" я выбираю текущую строку
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Заказ (создание) *'
И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'

