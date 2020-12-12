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