// Загрузка документа
$(document).ready(function () {
    var date_curent = moment().set({ 'hour': 0, 'minute': 0, 'second': 0, 'millisecond': 0 }),
        date_start = null,
        date_stop = null,
        bn = new BENZENE_API(), // Создадим класс TSK_API
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
                // Настроим выбор времени
                panel_report.select_sm = cd_initSelect(
                    panel_report.select_sm,
                    { width: 200 },
                    [{ value: 1, text: "Смена Д (07:00-18:59)" }, { value: 2, text: "Смена Н (19:00-06:59)" }],
                    null,
                    1,
                    function (event, ui) {
                        event.preventDefault();
                        // Обработать выбор смены
                        panel_report.view_report();
                    },
                    null);
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
                        //table_report.viewTable(true);
                        panel_report.select_sm.prop('disabled', true);
                        panel_report.bt_left.prop('disabled', true);
                        panel_report.bt_right.prop('disabled', true);
                    });
            },
            view_report: function () {
                if (panel_report.select_sm.val() === "2") {
                    date_start = moment(date_curent).set({ 'hour': 19, 'minute': 0, 'second': 0, 'millisecond': 0 })._d;
                    date_stop = moment(date_curent).add('days', 1).set({ 'hour': 6, 'minute': 59, 'second': 59, 'millisecond': 0 })._d;
                }
                if (panel_report.select_sm.val() === "1") {
                    date_start = moment(date_curent).set({ 'hour': 7, 'minute': 0, 'second': 0, 'millisecond': 0 })._d;
                    date_stop = moment(date_curent).set({ 'hour': 18, 'minute': 59, 'second': 59, 'millisecond': 0 })._d;
                }
                panel_report.obj_date_range.data('dateRangePicker').setDateRange(moment(date_start).format('DD.MM.YYYY HH:mm:'), moment(date_stop).format('DD.MM.YYYY HH:mm:'), true);
                table_report.viewTable(true);
                //table_report_curren.viewTable(true);
            }
        },
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
                    "ordering": true,
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

                    "footerCallback": function (row, data, start, end, display) {

                        var total_start_volume = 0;
                        var total_stop_volume = 0;
                        var total_start_mass = 0;
                        var total_stop_mass = 0;
                        var total_deff_volume = 0;
                        var total_deff_mass = 0;

                        var api = this.api(), data;
                        // Remove the formatting to get integer data for summation
                        var intVal = function (i) {
                            return typeof i === 'string' ?
                                i.replace(/[\$,]/g, '') * 1 :
                                typeof i === 'number' ?
                                    i : 0;
                        };
                        //
                        total_start_volume = api
                            .data()
                            .reduce(function (a, b) {
                                return intVal(a) + intVal(b.start_volume);
                            }, 0);
                        total_stop_volume = api
                            .data()
                            .reduce(function (a, b) {
                                return intVal(a) + intVal(b.stop_volume);
                            }, 0);
                        total_start_mass = api
                            .data()
                            .reduce(function (a, b) {
                                return intVal(a) + intVal(b.start_mass);
                            }, 0);
                        total_stop_mass = api
                            .data()
                            .reduce(function (a, b) {
                                return intVal(a) + intVal(b.stop_mass);
                            }, 0);
                        $('td#total_start_volume').text(Number(total_start_volume).toFixed(1));
                        $('td#total_stop_volume').text(Number(total_stop_volume).toFixed(1));
                        $('td#total_start_mass').text(Number(total_start_mass).toFixed(1));
                        $('td#total_stop_mass').text(Number(total_stop_mass).toFixed(1));
                        $('td#total_deff_volume').text(Number(total_start_volume - total_stop_volume).toFixed(1));
                        $('td#total_deff_mass').text(Number(total_start_mass - total_stop_mass).toFixed(1));
                    },

                    columns: [
                        {
                            //data: "fuel",
                            data: function (row, type, val, meta) {
                                return row.tank;
                            },
                            title: 'Емкость', width: "50px", orderable: true, searchable: false, className:'td-text'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.start_volume !==  null ? Number(row.start_volume).toFixed(1) : Number(0).toFixed(1);
                            },
                            title: 'Объем в начале (л)', width: "50px", orderable: false, searchable: false, className:'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.stop_volume !== null ? Number(row.stop_volume).toFixed(1) : Number(0).toFixed(1);
                            },
                            title: 'Объем в конце (л)', width: "50px", orderable: false, searchable: false, className:'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.start_mass !== null ? Number(row.start_mass).toFixed(1) : Number(0).toFixed(1);
                            },
                            title: 'Масса в начале (т)', width: "50px", orderable: false, searchable: false, className:'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.stop_mass !== null ? Number(row.stop_mass).toFixed(1) : Number(0).toFixed(1);
                            },
                            title: 'Масса в конце (т)', width: "50px", orderable: false, searchable: false, className:'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                var start = row.start_volume !== null ? Number(row.start_volume) : 0;
                                var stop = row.stop_volume !== null ? Number(row.stop_volume) : 0;
                                return Number(start - stop).toFixed(1)
                            },
                            title: 'Разница объем (л)', width: "50px", orderable: false, searchable: false, className:'td-number'
                        },
                        {
                            data: function (row, type, val, meta) {
                                var start = row.start_mass !== null ? Number(row.start_mass) : 0;
                                var stop = row.stop_mass !== null ? Number(row.stop_mass) : 0;
                                return Number(start - stop).toFixed(1)
                            },
                            title: 'Разница масса (т)', width: "50px", orderable: false, searchable: false, className:'td-number'
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
            },
            // Показать таблицу с данными
            viewTable: function (data_refresh) {
                LockScreen('Мы обрабатываем ваш запрос...');
                if (!table_report.list || data_refresh === true || !table_report.start || !table_report.stop || table_report.start!==date_start || table_report.stop!==date_stop ) {
                    // Обновим данные
                    bn.getDifferenceValueTanksOfInterval(
                        date_start,
                        date_stop,
                        function (result) {
                            table_report.start = date_start;
                            table_report.stop = date_stop;
                            table_report.list = result;
                            table_report.loadDataTable(result);
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
                table_report.list = data;
                table_report.obj.clear();
                table_report.obj.rows.add(data);
                LockScreenOff();
            },
        };

    // Инициализация
    panel_report.init();
    table_report.init();
    panel_report.view_report();
});