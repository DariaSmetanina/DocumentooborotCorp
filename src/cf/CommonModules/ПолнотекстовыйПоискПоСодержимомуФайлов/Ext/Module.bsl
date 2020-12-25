Процедура ОбновитьИндексСодержимымФайлов() Экспорт
	Отбор = Новый Структура("Изменен", Истина);
	ВыборкаИзмененныхФайлов = Справочники.Файлы.Выбрать(,,Отбор);

	Пока ВыборкаИзмененныхФайлов.Следующий() Цикл
		Файл = ВыборкаИзмененныхФайлов.ПолучитьОбъект();
		Файл.Изменен = Ложь;

		Если Не РаботаСФайламиКлиентСервер.ЭтоТекстовыйФайл(Файл.Наименование) Тогда
			Файл.Записать();
			Продолжить;
		КонецЕсли;

		ДвоичныеДанныеФайла = Файл.ФайлХранилище.Получить();
		ЧтениеДанных = Новый ЧтениеДанных(ДвоичныеДанныеФайла);

		Файл.Содержание = ЧтениеДанных.ПрочитатьСимволы();
		Файл.Записать();

		ЧтениеДанных.Закрыть();
	КонецЦикла;

	ПолнотекстовыйПоиск.ОбновитьИндекс();
КонецПроцедуры
