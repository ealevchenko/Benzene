//=========== ПЕРЕМЕННЫЕ ДЛЯ ТЕСТОВ ====================================================
// TODO:!!!ТЕСТ УБРАТЬ
var run_mode = Number(mode_run);
var blog = $.parseJSON(logs);
//------------------------------------------------------------------------
// Определение параметров переданных по url
$.extend({
    getUrlVars: function () {
        var vars = [], hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        return vars;
    },
    getUrlVar: function (name) {
        return $.getUrlVars()[name];
    }
});

/* ----------------------------------------------------------
    Компоненты UI
-------------------------------------------------------------*/
//// Инициализация компонента Select CD компонент
//var cd_initSelect = function (obj_select, property, data, callback_option, value_select, event_change, exceptions_value) {
//    var options = [];
//    var lang = 'ru';
//    var select = true;
//    if (property.lang) {
//        lang = property.lang;
//    }
//    if (property.select) {
//        select = property.select;
//    }
//    // Проверка выбор неопределен
//    if (value_select === -1 | select) {
//        options.push("<option value='-1' >" + (lang === 'en' ? 'Select...' : 'Выберите...') + "</option>");
//    }
//    if (data !== null) {
//        for (i = 0, count_data_select = data.length; i < count_data_select; i++) {
//            var option = { value: data[i].value, text: data[i].text, disabled: data[i].disabled };
//            // Преобразовать формат
//            if (typeof callback_option === 'function') {
//                option = callback_option(data[i]);
//            }
//            if (option !== null) {
//                if (exceptions_value !== null) {
//                    if (exceptions_value.indexOf(option.value) === -1) {
//                        options.push("<option value='" + option.value + "' " + (option.disabled ? "disabled='disabled'" : "") + ">" + option.text + "</option>");
//                    }
//                } else {
//                    options.push("<option value='" + option.value + "' " + (option.disabled ? "disabled='disabled'" : "") + ">" + option.text + "</option>");
//                }
//            }
//        }
//    }
//    obj_select.empty();
//    //obj_select.selectmenu({
//    //    icons: { button: "ui-icon ui-icon-circle-triangle-s" },
//    //    width: property.width,
//    //    change: event_change,
//    //}).selectmenu("menuWidget").addClass("overflow");;
//    // Заполним селект 
//    //obj_select.append(options.join(""))
//    //    .val(value_select)
//    //    .selectmenu("refresh");
//    obj_select.append(options.join("")).val(value_select);
//    obj_select.on("change", event_change);
//    return obj_select;
//};

//var cd_initDateTimeRangePicker = function (obj_select, property, close_function) {
//    var dtrp = {
//        obj: null,
//        lang: 'ru',
//        time: true,
//        select_date: null,
//        init: function (obj_select, property, close_function) {
//            if (property.lang === null) {
//                dtrp.lang = property.lang;
//            }
//            if (property.time !== null) {
//                dtrp.time = property.time;
//            }

//            dtrp.obj = obj_select.dateRangePicker(
//                {
//                    language: dtrp.lang,
//                    format: dtrp.lang === 'ru' ? 'DD.MM.YYYY' + (dtrp.time ? ' HH:mm' : '') : 'DD\MM\YYYY' + (dtrp.time ? ' HH:mm' : ''),
//                    autoClose: false,
//                    singleDate: true,
//                    singleMonth: true,
//                    showShortcuts: false,
//                    time: {
//                        enabled: dtrp.time
//                    },
//                }).
//                bind('datepicker-change', function (evt, obj) {
//                    dtrp.select_date = obj.date1;
//                }).bind('datepicker-closed', function () {
//                    //dtrp.setDateTime(dtrp.select_date); // Иначе дату не возможно убрать
//                    // Преобразовать формат
//                    if (typeof close_function === 'function') {
//                        close_function(dtrp.select_date);
//                    }
//                });
//        },
//        getDateTime: function () {
//            return dtrp.select_date;
//        },
//        setDateTime: function (datetime) {
//            var e = dtrp.obj.attr("disabled");
//            if (e === "disabled") {
//                dtrp.obj.prop("disabled", false);
//            }
//            if (datetime !== null) {
//                dtrp.obj.data('dateRangePicker').setDateRange(moment(datetime).format('DD.MM.YYYY' + (dtrp.time ? ' HH:mm' : '')), moment(datetime).format('DD.MM.YYYY' + (dtrp.time ? ' HH:mm' : '')), true);
//            } else {
//                // Установить текущую дату и время
//                dtrp.obj.data('dateRangePicker').setDateRange(moment().format('DD.MM.YYYY' + (dtrp.time ? ' HH:mm' : '')), moment().format('DD.MM.YYYY' + (dtrp.time ? ' HH:mm' : '')), true);
//                dtrp.obj.data('dateRangePicker').clear();
//                dtrp.select_date = null; // чтобы вернуло нет даты
//            }
//            if (e === "disabled") {
//                dtrp.obj.prop("disabled", true);
//            }
//        },
//        enable: function (enb) {
//            dtrp.obj.prop("disabled", !enb);
//        },
//        val: function () {
//            return dtrp.obj.val();
//            //dtrp.getDateTime();
//        }
//    };
//    dtrp.init(obj_select, property, close_function);
//    return dtrp;
//};

//==============================================================================================
/* ----------------------------------------------------------
    Компоненты UI
-------------------------------------------------------------*/
// Инициализация компонента Select CD компонент
var cd_initSelect = function (obj_select, property, data, callback_option, value_select, event_change, exceptions_value) {
    var options = [];
    var lang = 'ru';
    //var select = true;
    if (property.lang) {
        lang = property.lang;
    }
    //if (property.select) {
    //    select = property.select;
    //}
    // Проверка выбор неопределен
    if (value_select === -1) {
        options.push("<option value='-1' >" + (lang === 'en' ? 'Select...' : 'Выберите...') + "</option>");
    }
    if (data !== null) {
        for (i = 0, count_data_select = data.length; i < count_data_select; i++) {
            var option = { value: data[i].value, text: data[i].text, disabled: data[i].disabled };
            // Преобразовать формат
            if (typeof callback_option === 'function') {
                option = callback_option(data[i]);
            }
            if (option !== null) {
                if (exceptions_value !== null) {
                    if (exceptions_value.indexOf(option.value) === -1) {
                        options.push("<option value='" + option.value + "' " + (option.disabled ? "disabled='disabled'" : "") + ">" + option.text + "</option>");
                    }
                } else {
                    options.push("<option value='" + option.value + "' " + (option.disabled ? "disabled='disabled'" : "") + ">" + option.text + "</option>");
                }
            }
        }
    }
    obj_select.empty();
    //obj_select.selectmenu({
    //    icons: { button: "ui-icon ui-icon-circle-triangle-s" },
    //    width: property.width,
    //    change: event_change,
    //}).selectmenu("menuWidget").addClass("overflow");;
    // Заполним селект 
    //obj_select.append(options.join(""))
    //    .val(value_select)
    //    .selectmenu("refresh");
    obj_select.append(options.join("")).val(value_select);
    obj_select.on("change", event_change);
    return obj_select;
};

var cd_updateSelect = function (obj_select, property, data, callback_option, value_select, exceptions_value) {
    var options = [];
    var lang = 'ru';
    //var select = true;
    if (property.lang) {
        lang = property.lang;
    }
    // Проверка выбор неопределен
    if (value_select === -1) {
        options.push("<option value='-1' >" + (lang === 'en' ? 'Select...' : 'Выберите...') + "</option>");
    }
    if (data !== null) {
        for (i = 0, count_data_select = data.length; i < count_data_select; i++) {
            var option = { value: data[i].value, text: data[i].text, disabled: data[i].disabled };
            // Преобразовать формат
            if (typeof callback_option === 'function') {
                option = callback_option(data[i]);
            }
            if (option !== null) {
                if (exceptions_value !== null) {
                    if (exceptions_value.indexOf(option.value) === -1) {
                        options.push("<option value='" + option.value + "' " + (option.disabled ? "disabled='disabled'" : "") + ">" + option.text + "</option>");
                    }
                } else {
                    options.push("<option value='" + option.value + "' " + (option.disabled ? "disabled='disabled'" : "") + ">" + option.text + "</option>");
                }
            }
        }
    }
    obj_select.empty();
    obj_select.append(options.join("")).val(value_select);
    return obj_select;
};
//
var cd_initDateTimeRangePicker = function (obj_select, property, close_function) {
    var dtrp = {
        obj: null,
        lang: 'ru',
        time: true,
        select_date: null,
        init: function (obj_select, property, close_function) {
            if (property.lang == null) {
                dtrp.lang = property.lang;
            }
            if (property.time !== null) {
                dtrp.time = property.time;
            }

            dtrp.obj = obj_select.dateRangePicker(
                {
                    language: dtrp.lang,
                    format: dtrp.lang === 'ru' ? 'DD.MM.YYYY' + (dtrp.time ? ' HH:mm' : '') : 'DD\MM\YYYY' + (dtrp.time ? ' HH:mm' : ''),
                    autoClose: false,
                    singleDate: true,
                    singleMonth: true,
                    showShortcuts: false,
                    time: {
                        enabled: dtrp.time
                    },
                }).
                bind('datepicker-change', function (evt, obj) {
                    dtrp.select_date = obj.date1;
                }).bind('datepicker-closed', function () {
                    //dtrp.setDateTime(dtrp.select_date); // Иначе дату не возможно убрать
                    // Преобразовать формат
                    if (typeof close_function === 'function') {
                        close_function(dtrp.select_date);
                    }
                });
        },
        getDateTime: function () {
            return dtrp.select_date;
        },
        setDateTime: function (datetime) {
            var e = dtrp.obj.attr("disabled");
            if (e === "disabled") {
                dtrp.obj.prop("disabled", false);
            }
            if (datetime !== null) {
                dtrp.obj.data('dateRangePicker').setDateRange(moment(datetime).format('DD.MM.YYYY' + (dtrp.time ? ' HH:mm' : '')), moment(datetime).format('DD.MM.YYYY' + (dtrp.time ? ' HH:mm' : '')), true);
            } else {
                // Установить текущую дату и время
                dtrp.obj.data('dateRangePicker').setDateRange(moment().format('DD.MM.YYYY' + (dtrp.time ? ' HH:mm' : '')), moment().format('DD.MM.YYYY' + (dtrp.time ? ' HH:mm' : '')), true);
                dtrp.obj.data('dateRangePicker').clear();
                dtrp.select_date = null; // чтобы вернуло нет даты
            }
            if (e === "disabled") {
                dtrp.obj.prop("disabled", true);
            }
        },
        enable: function (enb) {
            dtrp.obj.prop("disabled", !enb);
        },
        val: function () {
            return dtrp.obj.val();
            //dtrp.getDateTime();
        }
    };
    dtrp.init(obj_select, property, close_function);
    return dtrp;
}
/* ----------------------------------------------------------
    Функции работы с компонентами jQuery UI
-------------------------------------------------------------*/
// Инициализация компонента Select JQuery UI компонент
var initSelect = function (obj_select, property, data, callback_option, value_select, event_change, exceptions_value) {
    var options = [];
    // Проверка выбор неопределен
    if (value_select === -1) {
        options.push("<option value='-1' >Выберите...</option>");
    }
    if (data !== null) {
        for (i = 0, count_data_select = data.length; i < count_data_select; i++) {
            var option = { value: data[i].value, text: data[i].text, disabled: data[i].disabled };
            // Преобразовать формат
            if (typeof callback_option === 'function') {
                option = callback_option(data[i]);
            }
            if (option !== null) {
                if (exceptions_value !== null) {
                    if (exceptions_value.indexOf(option.value) == -1) {
                        options.push("<option value='" + option.value + "' " + (option.disabled ? "disabled='disabled'" : "") + ">" + option.text + "</option>");
                    }
                } else {
                    options.push("<option value='" + option.value + "' " + (option.disabled ? "disabled='disabled'" : "") + ">" + option.text + "</option>");
                }
            }
        }
    }
    obj_select.empty();
    obj_select.selectmenu({
        icons: { button: "ui-icon ui-icon-circle-triangle-s" },
        width: property.width,
        change: event_change,
    }).selectmenu("menuWidget").addClass("overflow");
    // Заполним селект 
    obj_select.append(options.join(""))
        .val(value_select)
        .selectmenu("refresh");
    return obj_select;
};
// Обновим компонента Select
var updateOptionSelect = function (obj_select, data, callback_option, value_select, exceptions_value) {
    var options = [];
    // Проверка выбор неопределен
    if (value_select === -1) {
        options.push("<option value='-1' >Выберите...</option>");
    }
    if (data !== null) {
        for (i = 0, count_data_update = data.length; i < count_data_update; i++) {
            var option = { value: data[i].value, text: data[i].text, disabled: data[i].disabled };
            // Преобразовать формат
            if (typeof callback_option === 'function') {
                option = callback_option(data[i]);
            }
            if (option !== null) {
                if (exceptions_value !== null) {
                    if (exceptions_value.indexOf(option.value) === -1) {
                        options.push("<option value='" + option.value + "' " + (option.disabled ? "disabled='disabled'" : "") + ">" + option.text + "</option>");
                    }
                } else {
                    options.push("<option value='" + option.value + "' " + (option.disabled ? "disabled='disabled'" : "") + ">" + option.text + "</option>");
                }
            }
        }
    }
    // Заполним селект 
    obj_select.empty()
        .append(options.join(""))
        .val(value_select)
        .selectmenu("refresh");
};
/* ----------------------------------------------------------
    Функции работы с масивами
-------------------------------------------------------------*/
// Поиск элемента массива по ключу по всем объектам включая и вложенные
var getAllObjects = function (obj, key, val) {
    var objects = [];
    for (var i in obj) {
        if (!obj.hasOwnProperty(i)) continue;
        if (typeof obj[i] == 'object') {
            objects = objects.concat(getAllObjects(obj[i], key, val));
        } else if (i == key && obj[key] == val) {
            objects.push(obj);
        }
    }
    return objects;
};
// Поиск элемента массива по ключу по первому уровню 
var getObjects = function (obj, key, val) {
    var objects = [];
    for (var i in obj) {
        if (!obj.hasOwnProperty(i)) continue;
        if (typeof obj[i] == 'object') {
            objects = objects.concat(getChildObjects(obj[i], key, val));
        } else
            if (i == key && obj[key] == val) {
                objects.push(obj);
            }
    }
    return objects;
};
// Поиск элемента массива во вложенных обектах второго уровня 
var getChildObjects = function (obj, key, val) {
    var objects = [];
    for (var i in obj) {
        if (!obj.hasOwnProperty(i)) continue;
        if (typeof obj[i] == 'object' & false == true) {
            objects = objects.concat(getObjects(obj[i], key, val));
        } else
            if (i == key && obj[key] == val) {
                objects.push(obj);
            }
    }
    return objects;
};
// Вернуть объект из списка
var getObjOflist = function (list, field, value) {
    var res = getObjects(list, field, value);
    if (res !== null && res.length > 0) {
        return res[0];
    }
};
/* ----------------------------------------------------------
    Обработчики ajax - функций
-------------------------------------------------------------*/
// Событие перед запросом
var AJAXBeforeSend = function () {
    //OnBegin();
};
//// Обработка ошибок
//var OnAJAXError = function (x, y, z) {
//    //LockScreenOff();
//    if (x.status !== 404) {
//        alert(x.status + '\n' + y + '\n' + z);
//    }
//    //LockScreenOff();
//};

// Обработка ошибок
var OnAJAXErrorMetod = function (metod, x, y, z) {
    var status = "";
    var status_text = "";
    var message = "";

    if (x && x.status) {
        status = x.status;
    }
    if (x && x.statusText) {
        status_text = x.statusText;
    }
    if (x && x.responseJSON) {
        message = x.responseJSON.Message;
    }
    alert('Metod js : ' + metod + '\nStatus : ' + status + '\nStatusText : ' + status_text + '\nMessage : ' + message);
};
// Событие после выполнения
var AJAXComplete = function () {
    //LockScreenOff();
};
// Обработка ошибок
var OnAJAXErrorOfMessage = function (message) {
    updateTips(message);
};
/* ----------------------------------------------------------
    Функции блокировки  экрана
-------------------------------------------------------------*/
// Блокировать с текстом
var LockScreen = function (message) {
    var lock = document.getElementById('lockPanel');
    if (lock)
        lock.className = 'LockOn';
    lock.innerHTML = message;
};
// Разблокировать 
var LockScreenOff = function () {
    var lock = document.getElementById('lockPanel');
    if (lock)
        lock.className = 'LockOff';
};
/* ----------------------------------------------------------
    Вспомогательные функции
-------------------------------------------------------------*/
// Коррекция вывода даты с учетом зоны
var toISOStringTZ = function (date) {
    return date ? new Date(date.getTime() - (date.getTimezoneOffset() * 60000)).toISOString() : null;
};

// Настройка language(DataTables)
var language_table_ru = function () {
    return {
        "decimal": "",
        "emptyTable": "Нет данных в таблице",
        "info": "Отображение _START_ по _END_ из _TOTAL_ записей",
        "infoEmpty": "Отображение 0 to 0 of 0 записей",
        "infoFiltered": "(отфильтровано из _MAX_ всего записей)",
        "infoPostFix": "",
        "thousands": ".",
        "lengthMenu": "Показать  _MENU_ записей",
        "loadingRecords": "Загрузка...",
        "processing": "Обработка ...",
        "search": "Найти:",
        "zeroRecords": "Не найдено совпадающих записей",
        "paginate": {
            "first": "Первая",
            "last": "Последняя",
            "next": "Следующая",
            "previous": "Предыдущая"
        },
        "aria": {
            "sortAscending": ": активировать сортировку столбца по возрастанию",
            "sortDescending": ": активировать сортировку колонки по убыванию"
        },
    }
};

// Вернуть режим
var outMode = function (i) {
    if (i === null) return null;
    switch (Number(i)) {
        case 1: return "Резер. кер.";
        case 2: return "Резер.";
        case 3: return "Исх. пост.";
        case 4: return "Самовывоз";
        case 5: return "Бак";
        case 6: return "Цистерна";
        case 7: return "Пролив";
        default: return i;
    }
};

var outTypeFuel = function (i) {
    if (i === null) return null;
    switch (Number(i)) {
        case 0: return "Бензин";
        case 1: return "ДТ";
        case 2: return "Газ";
        default: return i;
    }
};
/* ----------------------------------------------------------
    api функции
-------------------------------------------------------------*/
// Обработка ошибок
var OnAJAXError = function (metod, x, y, z) {
    var status = "";
    var status_text = "";
    var message = "";

    if (x && x.status) {
        status = x.status;
    }
    if (x && x.statusText) {
        status_text = x.statusText;
    }
    if (x && x.responseJSON) {
        message = x.responseJSON.Message;
    }
    alert('Metod js : ' + metod + '\nStatus : ' + status + '\nStatusText : ' + status_text + '\nMessage : ' + message);
    //LockScreenOff();
    //if (x.status != 404) {

    //}
    LockScreenOff();
};

// Получить движение ГСМ в баках
var getFuelFlowTanks = function (start, stop, callback) {
    $.ajax({
        type: 'GET',
        url: '../../api/mariyskay/report/tanks_fuel_flow/start/' + toISOStringTZ(start).substring(0, 19) + '/stop/' + toISOStringTZ(stop).substring(0, 19),
        async: true,
        dataType: 'json',
        beforeSend: function () {
            AJAXBeforeSend();
        },
        success: function (data) {
            if (typeof callback === 'function') {
                callback(data);
            }
        },
        error: function (x, y, z) {
            OnAJAXError("getFuelFlowTanks", x, y, z);
        },
        complete: function () {
            AJAXComplete();
        },
    });
};

// Получить изменение за период в баках
var getTankOfPeriod = function (num, start, stop, callback) {
    $.ajax({
        type: 'GET',
        url: '../../api/mariyskay/report/tank/'+num+'/start/' + toISOStringTZ(start).substring(0, 19) + '/stop/' + toISOStringTZ(stop).substring(0, 19),
        async: true,
        dataType: 'json',
        beforeSend: function () {
            AJAXBeforeSend();
        },
        success: function (data) {
            if (typeof callback === 'function') {
                callback(data);
            }
        },
        error: function (x, y, z) {
            OnAJAXError("getTankOfPeriod", x, y, z);
        },
        complete: function () {
            AJAXComplete();
        },
    });
};

var getRemainsTanks = function (date, callback) {
    $.ajax({
        type: 'GET',
        url: '../../api/mariyskay/report/tanks_remains/date/' + toISOStringTZ(date).substring(0, 19),
        async: true,
        dataType: 'json',
        beforeSend: function () {
            AJAXBeforeSend();
        },
        success: function (data) {
            if (typeof callback === 'function') {
                callback(data);
            }
        },
        error: function (x, y, z) {
            OnAJAXError("getRemainsTanks", x, y, z);
        },
        complete: function () {
            AJAXComplete();
        },
    });
};
