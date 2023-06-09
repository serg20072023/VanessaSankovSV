﻿#language: ru

@tree

Функционал: Описание всего процесса запуска Сценарного тестирования 

Как Тестировщик я хочу
понять все этапы работы с Ванессой
чтобы успешно выполнить и протестировать   финальное задание

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Описание инсталяционных шагов
* Установка программ
	* 1. Развернуть пустую базу или копию, той что будем тестировать 
	* 2,1 скачаем ваннессу. Расширение и пакет https://github.com/Pr-Mex/vanessa-automation/releases
	* 2.1.1 пакет vanessa-automation.1.2.040.15.zip тут и запускаемый основной файл
	* 2.1.2 расширение VAExtension.cfe
	* 2.2 установить расширение Ванесса
	* 3. Установить Параметры  - Запуск Дополнительные - Режим тестирования 
	* 4. Теперь вспомогательное - Гит хаб вначале
	* 4.1 Зарегистрируем аккаунд на ГитХаб
	* 4.2 Создадим Ветку/проект
	* 4.3 Установим Гит на компе https://git-scm.com/download/win
	* 5. Аллур
	* 5.1 Скачем Аллюр https://github.com/allure-framework/allure2/releases/tag/2.14.0
	* 5.2 Установим Аллюр allure-2.14.0.zip      allure.bat 
	* 6. Вместо Нотепэд ++ Визуал студио для работы с текстовыми файлами 
	* 6.1 Скачаем https://code.visualstudio.com/Download
	* 7. Имадж 
	* 7.1 https://imagemagick.org/script/download.php#windows       ImageMagick-7.1.1-10-Q16-x64-dll.exe
	* 8. скрипт 
	* 8.1  https://ghostscript.com/releases/index.html  
	* 9 SDK
	* 9.1 https://developer.microsoft.com/en-us/windows/downloads/windows-sdk/      - позволяет определить название элемента окна и вызвать его через И я делаю клик по элементу клиента тестирования '+' '' UI Automation 
	* 9.2 file:///C:/Program%20Files%20(x86)/Windows%20Kits/10/bin/10.0.22621.0/x64/

	* 10  дополнительно 
	* ключи запуска Ваhttps://github.com/Pr-Mex/vanessa-automation/tree/develop/docs/CommandSetting  https://github.com/Pr-Mex/vanessa-automation/tree/develop/docs/JsonParams
	* https://oscript.io/ установить скрипт
	* описание языка гиркин https://wellbehaved.readthedocs.io/Gherkin.html   https://testgrow.ru/article18
	* моя ветка для тестов https://github.com/serg20072023/VanessaSankovSV/commits/main

* Работа по финальному заданию
	* заполнение базы 
	* 01 Задание  - установить расширение для добавления файлов нажатием. Добавить файл, обновить - проверить
	* 02 Задание  - проверить отчет - обязательно в цикле с паузой 20 секунд
	* 03 Задание  - полная проверка РасходТовара
	* 03.01 - тест на заполнение формы, разные варианты
	* 03.02 - тест на проведение по всем регистрам отдельно!
	* 03.03 - тест на сравнение печатной формы с макетом. Дату убрать из макета! Учесть возникновение ошибки ( в попытке,  и закрыть окно ошибки)




