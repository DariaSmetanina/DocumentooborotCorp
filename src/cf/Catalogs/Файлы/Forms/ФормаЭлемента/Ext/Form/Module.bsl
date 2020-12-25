﻿
&НаКлиенте
Процедура ДобавитьФайл(Команда)
	Оповещение  =  Новый ОписаниеОповещения("ВыборФайлаЗавершение", ЭтаФорма);
	НачатьПомещениеФайлаНаСервер(Оповещение,,,,, УникальныйИдентификатор);
КонецПроцедуры

&НаКлиенте
Процедура ВыборФайлаЗавершение(ОписаниеФайла, Параметр2) Экспорт
	Предпросмотр = ОписаниеФайла.Адрес;
 	Объект.Расширение = ОписаниеФайла.СсылкаНаФайл.Расширение;
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	ТекущийОбъект.Автор = РаботаСПользователем.ПолучитьТекущегоПользователя();
	Если ЭтоАдресВременногоХранилища(Предпросмотр) тогда
		ТекущийОбъект.Файл = Новый ХранилищеЗначения(ПолучитьИзВременногоХранилища(Предпросмотр)); 	
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Предпросмотр = ПолучитьНавигационнуюСсылку(Объект.Ссылка, "Файл"); 
КонецПроцедуры

&НаКлиенте
Процедура ЗавершениеОбратныйВызов(ОписаниеПомещенногоФайла, ДополнительныеПараметры) Экспорт
	Если ОписаниеПомещенногоФайла = Неопределено Или ОписаниеПомещенногоФайла.ПомещениеФайлаОтменено Тогда
		Возврат;
	КонецЕсли;

	Объект.Наименование = ОписаниеПомещенногоФайла.СсылкаНаФайл.Имя;
	СсылкаНаДанныеФайла = ОписаниеПомещенногоФайла.Адрес;
	ЭтоКартинка = РаботаСФайламиКлиентСервер.ЭтоКартинка(Объект.Наименование);

	Если Не ЭтоКартинка Тогда
		Элементы.Предпросмотр.Видимость = Ложь;
	Иначе
		Элементы.Предпросмотр.Видимость = Истина;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПрогрессОбратныйВызов(ПомещаемыйФайл, Помещено, ОтказОтПомещенияФайла, ДополнительныеПараметры) Экспорт
    Состояние("Файл " + ПомещаемыйФайл.Имя, Помещено, "Файл имеет размер " + ПомещаемыйФайл.Размер() + " байт", БиблиотекаКартинок.Документ);
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ЭтоКартинка = РаботаСФайламиКлиентСервер.ЭтоКартинка(Объект.Наименование);

	Если ЭтоКартинка Тогда
		СсылкаНаДанныеФайла = ПолучитьНавигационнуюСсылку(Объект.Ссылка, "ФайлХранилище");
	Иначе
		Элементы.Предпросмотр.Видимость = Ложь;
	КонецЕсли;
КонецПроцедуры
