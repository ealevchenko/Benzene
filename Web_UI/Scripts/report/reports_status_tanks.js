var bn = new BENZENE_API()

var showView = function () {
    // Время
    var d = new Date();
    $('#date-value').text(toISOStringTZ(d));
    bn.getRemainsTanksOfDate(
        d,
        function (result) {
            for (ir = 0, count_ir = result.length; ir < count_ir; ir++) {
                var tank = $.trim(result[ir].tank);
                var tl = result[ir].total_level !== null ? Number(result[ir].total_level).toFixed(2) : 0.00;
                var h = result[ir].level !== null ? Number(result[ir].level).toFixed(2) : 0.00;
                var hp = 0;
                if (tl !== null && Number(tl) > 0 && h !== null) {
                    hp = (Number(h) * 100.0) / Number(tank==="1"? 6000 : 6900);
                }
                hp = hp !== null ? Number(hp).toFixed(2) : 0.00;
                var v = result[ir].volume !== null ? Number(result[ir].volume).toFixed(2) : 0.00;
                var v15 = result[ir].volume !== null ? Number(result[ir].volume15).toFixed(2) : 0.00;
                var m = result[ir].mass !== null ? Number(result[ir].mass/1000).toFixed(2) : 0.00;
                var pd = result[ir].dens !== null ? Number(result[ir].dens).toFixed(4) : 0.0000; //?????
                var ps = result[ir].dens_avg !== null ? Number(result[ir].dens15).toFixed(4) : 0.0000;
                var t = result[ir].temp !== null ? (Number(result[ir].temp)).toFixed(2) : 0.00;
                var w = result[ir].water_level !== null ? (Number(result[ir].water_level)).toFixed(2) : 0.00;
                $('input#tank-' + tank + '-hp').val(hp);
                $('#pb-' + tank + '-cover').css('bottom', hp + '%');  // the cover controls the bar height
                $('#pb-' + tank + '-value').css('backgroundColor', (h > 47.0 ? '#0f0' : '#f00')); // value contains the bar color
                $('input#tank-' + tank + '-h').val(h);
                $('input#tank-' + tank + '-w').val(w);
                if (w > 0) {
                    $('input#tank-' + tank + '-w').addClass('water-error');
                } else {
                    $('input#tank-' + tank + '-w').removeClass('water-error');
                }
                $('input#tank-' + tank + '-v').val(v);
                $('input#tank-' + tank + '-m').val(m);
                $('input#tank-' + tank + '-pd').val(pd);
                $('input#tank-' + tank + '-ps').val(ps);
                $('input#tank-' + tank + '-t').val(t);
                //if (result[ir].dt !== null) {
                //    var seconds = parseInt((new Date() - StringToDate(result[ir].dt)) / 1000);
                //    if (seconds > 3000) {
                //        $('div#tank-' + result[ir].tank).addClass('error').attr('title', result[ir].dt);
                //    } else {
                //        $('div#tank-' + result[ir].tank).removeClass('error').attr('title', result[ir].dt);
                //    }
                //}
            }
        });
    //// Обновим данные
    //getAsyncViewReportTSOfDateTime(
    //    function (result) {
    //        for (ir = 0, count_ir = result.length; ir < count_ir; ir++) {



    //        }
    //    });
};




// Загрузка документа
$(document).ready(function () {
    var date_curent = moment()._d,
        //date_start = moment().set({ 'hour': 0, 'minute': 0, 'second': 0, 'millisecond': 0 })._d,
        //date_stop = moment().set({ 'hour': 23, 'minute': 59, 'second': 59, 'millisecond': 0 })._d,
        bn = new BENZENE_API(), // Создадим класс TSK_API
        date = moment()._d;

    $(document).ready(function () {
        //tab_type_reports.initObject();
        showView();
        setInterval('showView()', 10000);
    });
});