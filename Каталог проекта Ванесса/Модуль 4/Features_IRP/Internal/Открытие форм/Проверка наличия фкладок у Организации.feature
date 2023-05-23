﻿#language: ru

@tree
@БыстрыеПроверки

Функционал: проверка формы элемента справочника организации

Как Тестировкщик я хочу
проверить доступность вкладок налоги и валюты
чтобы убедиться что пользователь не ошибеться при вводе данных 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка доступронсти налоги и валюты в справочнике организации
	* Открытие элемента
		И В командном интерфейсе я выбираю 'Справочники' 'Организации'
		Тогда открылось окно 'Организации'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Организация (создание)'
	* Установка галочки Наша компания
		И я устанавливаю флаг с именем 'OurCompany'
		И элемент формы "валюты" присутствует на форме
		И элемент формы "Вид налога" присутствует на форме	
//	И я перехожу к закладке с именем "GroupCurrencies" // переход не помогает поскольку элемент есть , н оон не видим
//	И я перехожу к закладке с именем "GroupTaxes"
// используем поэтому Невидимости проверку!
	*снаятие галочки 
		Когда открылось окно 'Организация (создание) *'
		И я снимаю флаг  'Наша организация'
		И элемент формы "валюты" существует и невидим на форме
		И элемент формы "Вид налога" существует и невидим на форме	