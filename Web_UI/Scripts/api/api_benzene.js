/* ----------------------------------------------------------
    Обработчики ajax - функций
-------------------------------------------------------------*/
// Событие перед запросом
var AJAXBeforeSend = function () {
    //OnBegin();
}
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
// Событие после выполнения
var AJAXComplete = function () {
    //LockScreenOff();
};

var BENZENE_API = function () {

};
// Отчет движение топлива
BENZENE_API.prototype.getDifferenceValueTanksOfInterval = function (start, stop, callback) {
    $.ajax({
        type: 'GET',
        url: '../../api/tanks/report/difference_value_tanks/start/' + toISOStringTZ(start).substring(0, 19) + '/stop/' + toISOStringTZ(stop).substring(0, 19),
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
            OnAJAXError("BENZENE_API.getDifferenceValueTanksOfInterval", x, y, z);
        },
        complete: function () {
            AJAXComplete();
        },
    });
};
// Отчет остатки в емкости
BENZENE_API.prototype.getRemainsTanksOfDate = function (date, callback) {
    $.ajax({
        type: 'GET',
        url: '../../api/tanks/report/remains_tanks/date/' + toISOStringTZ(date).substring(0, 19),
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
            OnAJAXError("BENZENE_API.getRemainsTanksOfDate", x, y, z);
        },
        complete: function () {
            AJAXComplete();
        },
    });
};
// Отчет выдача
BENZENE_API.prototype.getFuelSalesOfInterval = function (start, stop, callback) {
    $.ajax({
        type: 'GET',
        url: '../../api/web/report/fuel_sales/start/' + toISOStringTZ(start).substring(0, 19) + '/stop/' + toISOStringTZ(stop).substring(0, 19),
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
            OnAJAXError("BENZENE_API.getFuelSalesOfInterval", x, y, z);
        },
        complete: function () {
            AJAXComplete();
        },
    });
};
// Выборка по Т1
BENZENE_API.prototype.getValueTanks1OfInterval = function (start, stop, callback) {
    $.ajax({
        type: 'GET',
        url: '../../api/tanks/report/interval_value_tanks1/start/' + toISOStringTZ(start).substring(0, 19) + '/stop/' + toISOStringTZ(stop).substring(0, 19),
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
            OnAJAXError("BENZENE_API.getValueTanks1OfInterval", x, y, z);
        },
        complete: function () {
            AJAXComplete();
        },
    });
};
// Выборка по Т2
BENZENE_API.prototype.getValueTanks2OfInterval = function (start, stop, callback) {
    $.ajax({
        type: 'GET',
        url: '../../api/tanks/report/interval_value_tanks2/start/' + toISOStringTZ(start).substring(0, 19) + '/stop/' + toISOStringTZ(stop).substring(0, 19),
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
            OnAJAXError("BENZENE_API.getValueTanks2OfInterval", x, y, z);
        },
        complete: function () {
            AJAXComplete();
        },
    });
};
// Отчет суточный
BENZENE_API.prototype.getDailyReportOfInterval = function (start, stop, callback) {
    $.ajax({
        type: 'GET',
        url: '../../api/web/report/daily/all/start/' + toISOStringTZ(start).substring(0, 19) + '/stop/' + toISOStringTZ(stop).substring(0, 19),
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
            OnAJAXError("BENZENE_API.getDailyReportOfInterval", x, y, z);
        },
        complete: function () {
            AJAXComplete();
        },
    });
};
// Отчет суточный
BENZENE_API.prototype.getDailyDetaliReportOfInterval = function (start, stop, callback) {
    $.ajax({
        type: 'GET',
        url: '../../api/web/report/daily/detali/start/' + toISOStringTZ(start).substring(0, 19) + '/stop/' + toISOStringTZ(stop).substring(0, 19),
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
            OnAJAXError("BENZENE_API.getDailyDetaliReportOfInterval", x, y, z);
        },
        complete: function () {
            AJAXComplete();
        },
    });
};
