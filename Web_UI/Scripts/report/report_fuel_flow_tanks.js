// Загрузка документа
$(document).ready(function () {
    var date_curent = moment().set({ 'hour': 0, 'minute': 0, 'second': 0, 'millisecond': 0 }),
        date_start = moment().set({ 'hour': 0, 'minute': 0, 'second': 0, 'millisecond': 0 })._d,
        date_stop = moment().set({ 'hour': 23, 'minute': 59, 'second': 59, 'millisecond': 0 })._d,
        //tsk = new TSK_API(), // Создадим класс TSK_API
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
                ////
                //panel_report.bt_left.on('click', function () {
                //    date_curent = moment(date_curent).add('days', -1);
                //    panel_report.obj_date.data('dateRangePicker').setDateRange(moment(date_curent).format('DD.MM.YYYY HH:mm:'), moment(date_curent).format('DD.MM.YYYY HH:mm:'), true);
                //    panel_report.view_report();
                //});
                ////
                //panel_report.bt_right.on('click', function () {
                //    date_curent = moment(date_curent).add('days', 1);
                //    panel_report.obj_date.data('dateRangePicker').setDateRange(moment(date_curent).format('DD.MM.YYYY HH:mm:'), moment(date_curent).format('DD.MM.YYYY HH:mm:'), true);
                //    panel_report.view_report();
                //});
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
                //panel_report.obj_date = panel_report.input_date.dateRangePicker(
                //    {
                //        language: 'ru',
                //        format: 'DD.MM.YYYY',
                //        autoClose: true,
                //        singleDate: true,
                //        singleMonth: true,
                //        showShortcuts: false
                //    }).
                //    bind('datepicker-change', function (evt, obj) {
                //        date_curent = obj.date1;
                //    })
                //    .bind('datepicker-closed', function () {
                //        panel_report.view_report();
                //        //panel_report.select_sm.prop('disabled', false);
                //        //panel_report.bt_left.prop('disabled', false);
                //        //panel_report.bt_right.prop('disabled', false);
                //    });
                //// Выставим текущую дату
                //panel_report.obj_date.data('dateRangePicker').setDateRange(moment(date_curent).format('DD.MM.YYYY HH:mm:'), moment(date_curent).format('DD.MM.YYYY HH:mm:'), true);
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
                        table_report.viewTable(false);
                        //panel_report.select_sm.prop('disabled', true);
                        //panel_report.bt_left.prop('disabled', true);
                        //panel_report.bt_right.prop('disabled', true);
                    });
                var date_curent_start = moment({ y: date_start.getFullYear(), M: date_start.getMonth(), d: date_start.getDate(), h: date_start.getHours(), m: date_start.getMinutes() });
                var date_curent_stop = moment({ y: date_stop.getFullYear(), M: date_stop.getMonth(), d: date_stop.getDate(), h: date_stop.getHours(), m: date_stop.getMinutes() });
                panel_report.obj_date_range.data('dateRangePicker').setDateRange(date_curent_start.format("DD.MM.YYYY HH:mm"), date_curent_stop.format("DD.MM.YYYY HH:mm"), true);
            },
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
                    //"filter": true,
                    //"scrollY": "600px",
                    sScrollX: "100%",
                    scrollX: true,
                    //"filter": true,
                    //"scrollY": "600px",
                    language: language_table_ru(),
                    jQueryUI: true,
                    "createdRow": function (row, data, index) {
                        $(row).attr('id', data.id);
                        $('td', row).eq(0).addClass('td-text');
                        $('td', row).eq(1).addClass('td-text');
                        $('td', row).eq(2).addClass('td-number');
                        $('td', row).eq(3).addClass('td-number');
                        $('td', row).eq(4).addClass('td-number');
                    },

                    "footerCallback": function (row, data, start, end, display) {

                        var total_tank_b_start = 0;
                        var total_tank_dt_start = 0;
                        var total_tank_g_start = 0;
                        var total_tank_b_stop = 0;
                        var total_tank_dt_stop = 0;
                        var total_tank_g_stop = 0;
                        var total_tank_b_deff = 0;
                        var total_tank_dt_deff = 0;
                        var total_tank_g_deff = 0;

                        var api = this.api(), data;
                        // Remove the formatting to get integer data for summation
                        var intVal = function (i) {
                            return typeof i === 'string' ?
                                i.replace(/[\$,]/g, '') * 1 :
                                typeof i === 'number' ?
                                    i : 0;
                        };
                        //
                        total_tank_b_start = api
                            .data()
                            .reduce(function (a, b) {
                                if (b.type_fuel === "Бензин") {
                                    return intVal(a) + intVal(b.start_value);
                                } else { return intVal(a); }
                            }, 0);

                        total_tank_dt_start = api
                            .data()
                            .reduce(function (a, b) {
                                if (b.type_fuel === "ДТ") {
                                    return intVal(a) + intVal(b.start_value);
                                } else { return intVal(a); }
                            }, 0);

                        total_tank_g_start = api
                            .data()
                            .reduce(function (a, b) {
                                if (b.type_fuel === "Газ") {
                                    return intVal(a) + intVal(b.start_value);
                                } else { return intVal(a); }
                            }, 0);
                        //
                        total_tank_b_stop = api
                            .data()
                            .reduce(function (a, b) {
                                if (b.type_fuel === "Бензин") {
                                    return intVal(a) + intVal(b.stop_value);
                                } else { return intVal(a); }
                            }, 0);

                        total_tank_dt_stop = api
                            .data()
                            .reduce(function (a, b) {
                                if (b.type_fuel === "ДТ") {
                                    return intVal(a) + intVal(b.stop_value);
                                } else { return intVal(a); }
                            }, 0);

                        total_tank_g_stop = api
                            .data()
                            .reduce(function (a, b) {
                                if (b.type_fuel === "Газ") {
                                    return intVal(a) + intVal(b.stop_value);
                                } else { return intVal(a); }
                            }, 0);
                        //
                        total_tank_b_deff = api
                            .data()
                            .reduce(function (a, b) {
                                if (b.type_fuel === "Бензин") {
                                    return intVal(a) + intVal(b.difference_value);
                                } else { return intVal(a); }
                            }, 0);

                        total_tank_dt_deff = api
                            .data()
                            .reduce(function (a, b) {
                                if (b.type_fuel === "ДТ") {
                                    return intVal(a) + intVal(b.difference_value);
                                } else { return intVal(a); }
                            }, 0);

                        total_tank_g_deff = api
                            .data()
                            .reduce(function (a, b) {
                                if (b.type_fuel === "Газ") {
                                    return intVal(a) + intVal(b.difference_value);
                                } else { return intVal(a); }
                            }, 0);


                        $('td#total_tank_b_start').text(total_tank_b_start);
                        $('td#total_tank_b_stop').text(total_tank_b_stop);
                        $('td#total_tank_b_deff').text(total_tank_b_deff);

                        $('td#total_tank_dt_start').text(total_tank_dt_start);
                        $('td#total_tank_dt_stop').text(total_tank_dt_stop);
                        $('td#total_tank_dt_deff').text(total_tank_dt_deff);

                        $('td#total_tank_g_start').text(total_tank_g_start);
                        $('td#total_tank_g_stop').text(total_tank_g_stop);
                        $('td#total_tank_g_deff').text(total_tank_g_deff);

                    },
                    columns: [
                        { data: "fuel", title: 'Название ГСМ', width: "50px", orderable: true, searchable: false },
                        { data: "type_fuel", title: 'Тип ГСМ', width: "50px", orderable: true, searchable: false },
                        { data: "start_value", title: 'Объем в начале (л)', width: "50px", orderable: false, searchable: false },
                        { data: "stop_value", title: 'Объем в конце (л)', width: "50px", orderable: false, searchable: false },
                        { data: "difference_value", title: 'Разница (л)', width: "50px", orderable: false, searchable: false },
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
                            sheetName: 'Движение ГСМ',
                            messageTop: function () {
                                return '';
                            }
                        },
                        //{
                        //    extend: 'colvis',
                        //    text: 'Выбрать поля таблицы',
                        //    collectionLayout: 'fixed two-column',
                        //    //postfixButtons: ['colvisRestore']
                        //},
                        //{
                        //    extend: 'colvisGroup',
                        //    text: 'Показать все поля',
                        //    show: ':hidden'
                        //},
                        //{
                        //    extend: 'pageLength',
                        //}
                    ],
                });
            },
            // Показать таблицу с данными
            viewTable: function (data_refresh) {
                LockScreen('Мы обрабатываем ваш запрос...');
                if (!table_report.list || data_refresh === true || !table_report.start || !table_report.stop || table_report.start!==date_start || table_report.stop!==date_stop ) {
                    // Обновим данные
                    getFuelFlowTanks(
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
                for (i = 0; i < data.length; i++) {
                    table_report.obj.row.add(table_report.getRow(data[i]));
                }
                LockScreenOff();
                //table_report.initComplete();
            },
            // Получить строку для таблицы
            getRow: function (data) {
                return {
                    "id": data.id,
                    "fuel": data.fuel,
                    "type": data.type,
                    "type_fuel": outTypeFuel(data.type),
                    "start_value": data.start_value,
                    "stop_value": data.stop_value,
                    "difference_value": data.start_value && data.stop_value ? Number(data.stop_value) - Number(data.start_value) : 0
                };
            },
        };

    // Инициализация
    panel_report.init();
    table_report.init();
    table_report.viewTable(true);
});