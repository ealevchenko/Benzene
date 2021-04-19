// Загрузка документа
$(document).ready(function () {
    var date_curent = moment().set({ 'hour': 0, 'minute': 0, 'second': 0, 'millisecond': 0 }),
        date_start = moment(date_curent).set({ 'hour': 0, 'minute': 0, 'second': 0, 'millisecond': 0 })._d,
        date_stop = moment(date_curent).set({ 'hour': 23, 'minute': 59, 'second': 59, 'millisecond': 0 })._d,
        bn = new BENZENE_API(), // Создадим класс TSK_API
        //
        panel_report = {
            bt_left: $('button#bt-left'),
            bt_right: $('button#bt-right'),
            select_sm: $('select#select-smena'),
            span_range_date: $('span#select-range-date'),
            input_date: $('input#date'),
            input_data_start: $('input#date-start'),
            input_data_stop: $('input#date-stop'),
            obj_date: null,
            obj_date_range: null,
            init: function () {
                //
                panel_report.bt_left.on('click', function () {
                    date_curent = moment(date_curent).add('days', -1);
                    panel_report.obj_date.data('dateRangePicker').setDateRange(moment(date_curent).format('DD.MM.YYYY HH:mm:'), moment(date_curent).format('DD.MM.YYYY HH:mm:'), true);
                    panel_report.view_report();
                });
                //
                panel_report.bt_right.on('click', function () {
                    date_curent = moment(date_curent).add('days', 1);
                    panel_report.obj_date.data('dateRangePicker').setDateRange(moment(date_curent).format('DD.MM.YYYY HH:mm:'), moment(date_curent).format('DD.MM.YYYY HH:mm:'), true);
                    panel_report.view_report();
                });
                //// Настроим выбор времени
                //panel_report.select_sm = cd_initSelect(
                //    panel_report.select_sm,
                //    { width: 200 },
                //    [{ value: 1, text: "Смена Д (07:00-18:59)" }, { value: 2, text: "Смена Н (19:00-06:59)" }],
                //    null,
                //    1,
                //    function (event, ui) {
                //        event.preventDefault();
                //        // Обработать выбор смены
                //        panel_report.view_report();
                //    },
                //    null);
                // настроим компонент выбора времени
                panel_report.obj_date = panel_report.input_date.dateRangePicker(
                    {
                        language: 'ru',
                        format: 'DD.MM.YYYY',
                        autoClose: true,
                        singleDate: true,
                        singleMonth: true,
                        showShortcuts: false
                    }).
                    bind('datepicker-change', function (evt, obj) {
                        date_curent = obj.date1;
                    })
                    .bind('datepicker-closed', function () {
                        panel_report.view_report();
                        panel_report.select_sm.prop('disabled', false);
                        panel_report.bt_left.prop('disabled', false);
                        panel_report.bt_right.prop('disabled', false);
                    });
                // Выставим текущую дату
                panel_report.obj_date.data('dateRangePicker').setDateRange(moment(date_curent).format('DD.MM.YYYY HH:mm:'), moment(date_curent).format('DD.MM.YYYY HH:mm:'), true);
                // настроим компонент выбора времени
                panel_report.obj_date_range = panel_report.span_range_date.dateRangePicker(
                    {
                        language: 'ru',
                        format: 'DD.MM.YYYY HH:mm',
                        separator: '-',
                        autoClose: false,
                        time: {
                            enabled: true
                        },
                        setValue: function (s, s1, s2) {
                            panel_report.input_data_start.val(s1);
                            panel_report.input_data_stop.val(s2);

                        }
                    }).
                    bind('datepicker-change', function (evt, obj) {
                        date_start = obj.date1;
                        date_stop = obj.date2;
                    })
                    .bind('datepicker-closed', function () {
                        table_report.viewTable(true);
                        panel_report.select_sm.prop('disabled', true);
                        panel_report.bt_left.prop('disabled', true);
                        panel_report.bt_right.prop('disabled', true);
                    });
            },
            view_report: function () {
                date_start = moment(date_curent).set({ 'hour': 0, 'minute': 0, 'second': 0, 'millisecond': 0 })._d;
                date_stop = moment(date_curent).set({ 'hour': 23, 'minute': 59, 'second': 59, 'millisecond': 0 })._d;
                //if (panel_report.select_sm.val() === "2") {
                //    date_start = moment(date_curent).set({ 'hour': 19, 'minute': 0, 'second': 0, 'millisecond': 0 })._d;
                //    date_stop = moment(date_curent).add('days', 1).set({ 'hour': 6, 'minute': 59, 'second': 59, 'millisecond': 0 })._d;
                //}
                //if (panel_report.select_sm.val() === "1") {
                //    date_start = moment(date_curent).set({ 'hour': 7, 'minute': 0, 'second': 0, 'millisecond': 0 })._d;
                //    date_stop = moment(date_curent).set({ 'hour': 18, 'minute': 59, 'second': 59, 'millisecond': 0 })._d;
                //}
                panel_report.obj_date_range.data('dateRangePicker').setDateRange(moment(date_start).format('DD.MM.YYYY HH:mm:'), moment(date_stop).format('DD.MM.YYYY HH:mm:'), true);
                table_report.viewTable(true);
            }
        },
        ////
        //table_detali = $('table#table-report-detali').DataTable({
        //    "paging": false,
        //    "ordering": true,
        //    "info": false,
        //    "select": true,
        //    "autoWidth": false,
        //    "scrollX": true,
        //    jQueryUI: false,
        //    //"createdRow": function (row, data, index) {
        //    //    if (data.count_tanks_delivery > 1)
        //    //        $(row).addClass("total-issue");
        //    //},
        //    columns: [
        //        {
        //            data: function (row, type, val, meta) {
        //                return getReplaceTOfDT(row.start_dt);
        //            },
        //            className: 'dt-body-center',
        //            title: 'Начало выборки', width: "50px", orderable: true, searchable: false, className: 'td-text'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return getReplaceTOfDT(row.stop_dt);
        //            },
        //            className: 'dt-body-center',
        //            title: 'Конец выборки', width: "50px", orderable: true, searchable: false, className: 'td-text'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.tank;
        //            },
        //            className: 'dt-body-center',
        //            title: '№ Емкости', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        // Начало
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.start_volume !== null ? Number(row.start_volume).toFixed(2) : Number(0).toFixed(2);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Остаток, объем на начало выборки (л)', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.start_volume15 !== null ? Number(row.start_volume15).toFixed(2) : Number(0).toFixed(2);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Остаток, объем на начало выборки (л), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.start_mass !== null ? Number(row.start_mass / 1000).toFixed(2) : Number(0).toFixed(2);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Остаток, масса на начало выборки (т)', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.start_dens !== null ? Number(row.start_dens).toFixed(4) : Number(0).toFixed(4);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Остаток, плотность на начало выборки (кг/м3)', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.start_dens15 !== null ? Number(row.start_dens15).toFixed(4) : Number(0).toFixed(4);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Остаток, плотность на начало выборки (кг/м3), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        // Приход
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.deliverys_volume !== null ? Number(row.deliverys_volume).toFixed(2) : Number(0).toFixed(2);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Приход, объем (л)', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.deliverys_volume15 !== null ? Number(row.deliverys_volume15).toFixed(2) : Number(0).toFixed(2);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Приход, объем (л), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.deliverys_mass !== null ? Number(row.deliverys_mass / 1000).toFixed(2) : Number(0).toFixed(2);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Приход, масса (т)', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.deliverys_dens !== null ? Number(row.deliverys_dens).toFixed(4) : Number(0).toFixed(4);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Приход, плотность (кг/м3)', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.deliverys_dens15 !== null ? Number(row.deliverys_dens15).toFixed(4) : Number(0).toFixed(4);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Приход, плотность (кг/м3), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        // Выдача
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.dispensing_volume !== null ? Number(row.dispensing_volume).toFixed(2) : Number(0).toFixed(2);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Расход, объем (л)', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.dispensing_volume15 !== null ? Number(row.dispensing_volume15).toFixed(2) : Number(0).toFixed(2);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Расход, объем (л), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.dispensing_mass !== null ? Number(row.dispensing_mass / 1000).toFixed(2) : Number(0).toFixed(2);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Расход, масса (т)', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.dispensing_dens !== null ? Number(row.dispensing_dens).toFixed(4) : Number(0).toFixed(4);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Расход, плотность (кг/м3)', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.dispensing_dens15 !== null ? Number(row.dispensing_dens15).toFixed(4) : Number(0).toFixed(4);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Расход, плотность (кг/м3), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        // Конец
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.stop_volume !== null ? Number(row.stop_volume).toFixed(2) : Number(0).toFixed(2);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Остаток, объем на конец выборки (л)', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.stop_volume15 !== null ? Number(row.stop_volume15).toFixed(2) : Number(0).toFixed(2);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Остаток, объем на конец выборки (л), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.stop_mass !== null ? Number(row.stop_mass / 1000).toFixed(2) : Number(0).toFixed(2);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Остаток, масса на конец выборки (т)', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.stop_dens !== null ? Number(row.stop_dens).toFixed(4) : Number(0).toFixed(4);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Остаток, плотность на конец выборки (кг/м3)', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //        {
        //            data: function (row, type, val, meta) {
        //                return row.stop_dens15 !== null ? Number(row.stop_dens15).toFixed(4) : Number(0).toFixed(4);
        //            },
        //            className: 'dt-body-right',
        //            title: 'Остаток, плотность на конец выборки (кг/м3), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
        //        },
        //    ],
        //    dom: 'Blftipr',
        //    buttons: [
        //        'copyHtml5',
        //        {
        //            extend: 'excelHtml5',
        //            sheetName: 'Детально',
        //            messageTop: 'Период отчета за ' + (data.date_start !== null ? data.date_start.split('T').join(' ') : ''),
        //        }
        //    ]
        //}),
        //
        table_report = {
            html_table: $('#table-report'),
            obj: null,
            list: null,
            start: null,
            stop: null,
            // Инициализировать таблицу
            init: function () {
                table_report.obj = this.html_table.DataTable({
                    //"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                    "paging": false,
                    "searching": false,
                    "ordering": false,
                    "info": false,
                    "select": false,
                    "autoWidth": true,
                    sScrollX: "100%",
                    scrollX: true,
                    language: language_table_ru(),
                    jQueryUI: false,
                    "createdRow": function (row, data, index) {
                        //$(row).attr('id', data.id);
                    },
                    //"footerCallback": function (row, data, start, end, display) {

                    //    var total_volume = 0;
                    //    var total_mass = 0;
                    //    var total_dens = 0;

                    //    var api = this.api(), data;
                    //    // Remove the formatting to get integer data for summation
                    //    var intVal = function (i) {
                    //        return typeof i === 'string' ?
                    //            i.replace(/[\$,]/g, '') * 1 :
                    //            typeof i === 'number' ?
                    //                i : 0;
                    //    };
                    //    //
                    //    total_volume = api
                    //        .data()
                    //        .reduce(function (a, b) {
                    //            return intVal(a) + intVal(b.volume);
                    //        }, 0);
                    //    //
                    //    total_mass = api
                    //        .data()
                    //        .reduce(function (a, b) {
                    //            return intVal(a) + intVal(b.mass);
                    //        }, 0);

                    //    $('td#total_volume').text(Number(total_volume).toFixed(1));
                    //    $('td#total_mass').text(Number(total_mass).toFixed(1));
                    //    if (total_mass > 0 && total_volume > 0) {
                    //        total_dens = (total_mass / total_volume) * 1000;
                    //    }
                    //    $('td#total_dens').text(Number(total_dens).toFixed(1));
                    //},

                    columns: [
                        {
                            className: 'details-control',
                            orderable: false,
                            data: null,
                            defaultContent: '',
                            searchable: false, width: "30px"
                        },
                        {
                            data: function (row, type, val, meta) {
                                return getReplaceTOfDT(row.start_dt);
                            },
                            className: 'dt-body-center',
                            title: 'Начало выборки', width: "50px", orderable: true, searchable: false, className: 'td-text'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return getReplaceTOfDT(row.stop_dt);
                            },
                            className: 'dt-body-center',
                            title: 'Конец выборки', width: "50px", orderable: true, searchable: false, className: 'td-text'
                        },
                        // Начало
                        {
                            data: function (row, type, val, meta) {
                                return row.start_volume !== null ? Number(row.start_volume).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, объем на начало выборки (л)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.start_volume15 !== null ? Number(row.start_volume15).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, объем на начало выборки (л), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.start_mass !== null ? Number(row.start_mass/1000).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, масса на начало выборки (т)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.start_dens !== null ? Number(row.start_dens).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, плотность на начало выборки (кг/м3)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.start_dens15 !== null ? Number(row.start_dens15).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, плотность на начало выборки (кг/м3), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        // Приход
                        {
                            data: function (row, type, val, meta) {
                                return row.deliverys_volume !== null ? Number(row.deliverys_volume).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Приход, объем (л)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.deliverys_volume15 !== null ? Number(row.deliverys_volume15).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Приход, объем (л), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.deliverys_mass !== null ? Number(row.deliverys_mass/1000).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Приход, масса (т)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.deliverys_dens !== null ? Number(row.deliverys_dens).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Приход, плотность (кг/м3)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.deliverys_dens15 !== null ? Number(row.deliverys_dens15).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Приход, плотность (кг/м3), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        // Выдача
                        {
                            data: function (row, type, val, meta) {
                                return row.dispensing_volume !== null ? Number(row.dispensing_volume).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Расход, объем (л)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.dispensing_volume15 !== null ? Number(row.dispensing_volume15).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Расход, объем (л), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.dispensing_mass !== null ? Number(row.dispensing_mass/1000).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Расход, масса (т)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.dispensing_dens !== null ? Number(row.dispensing_dens).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Расход, плотность (кг/м3)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.dispensing_dens15 !== null ? Number(row.dispensing_dens15).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Расход, плотность (кг/м3), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        // Конец
                        {
                            data: function (row, type, val, meta) {
                                return row.stop_volume !== null ? Number(row.stop_volume).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, объем на конец выборки (л)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.stop_volume15 !== null ? Number(row.stop_volume15).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, объем на конец выборки (л), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.stop_mass !== null ? Number(row.stop_mass / 1000).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, масса на конец выборки (т)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.stop_dens !== null ? Number(row.stop_dens).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, плотность на конец выборки (кг/м3)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.stop_dens15 !== null ? Number(row.stop_dens15).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, плотность на конец выборки (кг/м3), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                    ],
                    dom: 'Bfrtip',
                    stateSave: false,
                    buttons: [
                        {
                            text: 'Буфер',
                            extend: 'copyHtml5',
                        },
                        {
                            text: 'Excel',
                            extend: 'excelHtml5',
                            sheetName: 'Движение бензола',
                            messageTop: function () {
                                return '';
                            }
                        },
                    ],
                });
                table_report.initEventSelectChild();
            },
            // Показать таблицу с данными
            viewTable: function (data_refresh) {
                LockScreen('Мы обрабатываем ваш запрос...');
                if (!table_report.list || data_refresh === true || !table_report.start || !table_report.stop || table_report.start !== date_start || table_report.stop !== date_stop) {
                    // Обновим данные
                    bn.getDailyReportOfInterval(
                        date_start,
                        date_stop,
                        function (result) {
                            table_report.start = date_start;
                            table_report.stop = date_stop;
                            table_report.list = result;
                            table_report.loadDataTable(table_report.list);
                            table_report.obj.draw();
                        }
                    );
                } else {
                    table_report.loadDataTable(table_report.list);
                    table_report.obj.draw();
                };
            },
            // Загрузить данные
            loadDataTable: function (data) {
                //table_report.list = data;
                table_report.obj.clear();
                table_report.obj.rows.add(data);
                LockScreenOff();
                //table_report.initComplete();
            },
            // Показать детали
            initEventSelectChild: function () {
                this.html_table.find('tbody')
                    .on('click', 'td.details-control', function () {
                        var tr = $(this).closest('tr');
                        var row = table_report.obj.row(tr);
                        if (row.child.isShown()) {
                            // This row is already open - close it
                            row.child.hide();
                            tr.removeClass('shown');
                        }
                        else {
                            row.child($('<tr id="detali-transfer"><td colspan="23"><div id="detali-report" class="detali-operation"> ' +
                                '<table class= "display compact cell-border row-border hover" id="table-report-detali" style = "width:100%" cellpadding = "0" ></table>' +
                                '</div></td></tr> ')).show();
                            table_report.viewTableDetali(row.data());
                            tr.addClass('shown');
                        }
                    });
            },
            // Показать детали
            viewTableDetali: function (data) {

                var table_detali = $('table#table-report-detali').DataTable({
                    "paging": false,
                    "searching": false,
                    "ordering": false,
                    "info": false,
                    "select": true,
                    "autoWidth": false,
                    "scrollX": true,
                    jQueryUI: false,
                    //"createdRow": function (row, data, index) {
                    //    if (data.count_tanks_delivery > 1)
                    //        $(row).addClass("total-issue");
                    //},
                    columns: [
                        //{
                        //    data: function (row, type, val, meta) {
                        //        return getReplaceTOfDT(row.start_dt);
                        //    },
                        //    className: 'dt-body-center',
                        //    title: 'Начало выборки', width: "50px", orderable: true, searchable: false, className: 'td-text'
                        //},
                        //{
                        //    data: function (row, type, val, meta) {
                        //        return getReplaceTOfDT(row.stop_dt);
                        //    },
                        //    className: 'dt-body-center',
                        //    title: 'Конец выборки', width: "50px", orderable: true, searchable: false, className: 'td-text'
                        //},
                        {
                            data: function (row, type, val, meta) {
                                return row.tank;
                            },
                            className: 'dt-body-center',
                            title: '№ Емкости', width: "130px", orderable: false, searchable: false, className: 'td-number'
                        },
                        // Начало
                        {
                            data: function (row, type, val, meta) {
                                return row.start_volume !== null ? Number(row.start_volume).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, объем на начало выборки (л)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.start_volume15 !== null ? Number(row.start_volume15).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, объем на начало выборки (л), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.start_mass !== null ? Number(row.start_mass / 1000).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, масса на начало выборки (т)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.start_dens !== null ? Number(row.start_dens).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, плотность на начало выборки (кг/м3)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.start_dens15 !== null ? Number(row.start_dens15).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, плотность на начало выборки (кг/м3), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        // Приход
                        {
                            data: function (row, type, val, meta) {
                                return row.deliverys_volume !== null ? Number(row.deliverys_volume).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Приход, объем (л)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.deliverys_volume15 !== null ? Number(row.deliverys_volume15).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Приход, объем (л), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.deliverys_mass !== null ? Number(row.deliverys_mass / 1000).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Приход, масса (т)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.deliverys_dens !== null ? Number(row.deliverys_dens).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Приход, плотность (кг/м3)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.deliverys_dens15 !== null ? Number(row.deliverys_dens15).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Приход, плотность (кг/м3), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        // Выдача
                        {
                            data: function (row, type, val, meta) {
                                return row.dispensing_volume !== null ? Number(row.dispensing_volume).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Расход, объем (л)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.dispensing_volume15 !== null ? Number(row.dispensing_volume15).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Расход, объем (л), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.dispensing_mass !== null ? Number(row.dispensing_mass / 1000).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Расход, масса (т)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.dispensing_dens !== null ? Number(row.dispensing_dens).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Расход, плотность (кг/м3)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.dispensing_dens15 !== null ? Number(row.dispensing_dens15).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Расход, плотность (кг/м3), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        // Конец
                        {
                            data: function (row, type, val, meta) {
                                return row.stop_volume !== null ? Number(row.stop_volume).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, объем на конец выборки (л)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.stop_volume15 !== null ? Number(row.stop_volume15).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, объем на конец выборки (л), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.stop_mass !== null ? Number(row.stop_mass / 1000).toFixed(2) : Number(0).toFixed(2);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, масса на конец выборки (т)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.stop_dens !== null ? Number(row.stop_dens).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, плотность на конец выборки (кг/м3)', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.stop_dens15 !== null ? Number(row.stop_dens15).toFixed(4) : Number(0).toFixed(4);
                            },
                            className: 'dt-body-right',
                            title: 'Остаток, плотность на конец выборки (кг/м3), привед. к 15 град', width: "50px", orderable: false, searchable: false, className: 'td-number'
                        },
                    ],
                    dom: 'Blftipr',
                    buttons: [
                        'copyHtml5',
                        {
                            extend: 'excelHtml5',
                            sheetName: 'Детально',
                            messageTop: 'Период отчета c ' + getReplaceTOfDT(data.start_dt) + ' по ' + getReplaceTOfDT(data.stop_dt)
                        }
                    ]
                });

                LockScreen('Мы обрабатываем ваш запрос...');
                bn.getDailyDetaliReportOfInterval(
                    date_start,
                    date_stop,
                    function (result) {
                        table_detali.clear();
                        table_detali.rows.add(result);
                        LockScreenOff();
                        table_detali.draw();
                    }
                );
            }
        };

    // Инициализация
    panel_report.init();
    table_report.init();
    panel_report.view_report();
});