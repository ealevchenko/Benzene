// Загрузка документа
$(document).ready(function () {
    var date_curent = moment()._d,
        //date_start = moment().set({ 'hour': 0, 'minute': 0, 'second': 0, 'millisecond': 0 })._d,
        //date_stop = moment().set({ 'hour': 23, 'minute': 59, 'second': 59, 'millisecond': 0 })._d,
        bn = new BENZENE_API(), // Создадим класс TSK_API
        date = moment()._d,
        panel_report = {
            input_date: $('input#date'),
            obj_date: null,
            obj_date_range: null,
            init: function () {
                 //настроим компонент выбора времени
                panel_report.obj_date = panel_report.input_date.dateRangePicker(
                    {
                        language: 'ru',
                        format: 'DD.MM.YYYY HH:mm',
                        autoClose: false,
                        singleDate: true,
                        singleMonth: true,
                        showShortcuts: false,
                        time: {
                            enabled: true
                        },
                    }).
                    bind('datepicker-change', function (evt, obj) {
                        date_curent = obj.date1;
                    })
                    .bind('datepicker-closed', function () {
                        date = date_curent;
                        table_report.viewTable(false);
                    });
                // Выставим текущую дату
                panel_report.obj_date.data('dateRangePicker').setDateRange(moment(date_curent).format('DD.MM.YYYY HH:mm:'), moment(date_curent).format('DD.MM.YYYY HH:mm:'), true);
           },
        },
        //
        table_report = {
            html_table: $('#table-report'),
            obj: null,
            list: null,
            date: null,
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
                        $('td', row).eq(5).addClass('td-number');
                        $('td', row).eq(6).addClass('td-number');
                        $('td', row).eq(7).addClass('td-number');
                        $('td', row).eq(8).addClass('td-number');
                        $('td', row).eq(9).addClass('td-number');
                        $('td', row).eq(10).addClass('td-number');
                    },
                    "footerCallback": function (row, data, start, end, display) {

                        var total_volume = 0;
                        var total_volume15 = 0;
                        var total_mass = 0;
/*                        var total_mass15 = 0;*/
                        var total_dens = 0;
                        var total_dens15 = 0;

                        var api = this.api(), data;
                        // Remove the formatting to get integer data for summation
                        var intVal = function (i) {
                            return typeof i === 'string' ?
                                i.replace(/[\$,]/g, '') * 1 :
                                typeof i === 'number' ?
                                    i : 0;
                        };
                        //
                        total_volume = api
                            .data()
                            .reduce(function (a, b) {
                                return intVal(a) + intVal(b.volume);
                            }, 0);

                        total_volume15 = api
                            .data()
                            .reduce(function (a, b) {
                                return intVal(a) + intVal(b.volume15);
                            }, 0);
                        //
                        total_mass = api
                            .data()
                            .reduce(function (a, b) {
                                return intVal(a) + intVal(b.mass);
                            }, 0);

                        //total_mass15 = api
                        //    .data()
                        //    .reduce(function (a, b) {
                        //        return intVal(a) + intVal(b.total_mass15);
                        //    }, 0);

                        $('td#total_volume').text(total_volume !== null ? Number(total_volume).toFixed(2) : Number(0).toFixed(2));
                        $('td#total_volume15').text(total_volume15 !== null ? Number(total_volume15).toFixed(2) : Number(0).toFixed(2));
                        $('td#total_mass').text(total_mass !== null ? Number(total_mass).toFixed(2) : Number(0).toFixed(2));
                        if (total_mass > 0 && total_volume > 0) {
                            total_dens = (total_mass / total_volume) * 1000;
                        }
                        if (total_mass > 0 && total_volume15 > 0) {
                            total_dens15 = (total_mass / total_volume15) * 1000;
                        }          
                        $('td#total_dens').text(total_dens !== null ? Number(total_dens).toFixed(2) : Number(0).toFixed(2));
                        $('td#total_dens15').text(total_dens15 !== null ? Number(total_dens15).toFixed(2) : Number(0).toFixed(2));                        
                    },
                    columns: [
                        {
                            data: function (row, type, val, meta) {
                                return row.dt ? row.dt.replace(/T/g, ' ') : null;
                            },
                            title: 'Дата и время', width: "50px", orderable: true, searchable: false
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.tank;
                            },
                            title: 'Емкость', width: "50px", orderable: true, searchable: false
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.total_level !== null ? Number(row.total_level).toFixed(2) : Number(0).toFixed(2);
                            },
                            title: 'Уровень емкости (мм)', width: "50px", orderable: true, searchable: false
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.level !== null ? Number(row.level).toFixed(2) : Number(0).toFixed(2);
                            },
                            title: 'Уровень (мм)', width: "50px", orderable: true, searchable: false
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.volume !== null ? Number(row.volume).toFixed(2) : Number(0).toFixed(2);
                            },
                            title: 'Объем (л)', width: "50px", orderable: true, searchable: false
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.volume15 !== null ? Number(row.volume15).toFixed(2) : Number(0).toFixed(2);
                                
                            },
                            title: 'Объем пр. к 15 гр. (л)', width: "50px", orderable: true, searchable: false
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.mass !== null ? Number(row.mass).toFixed(2) : Number(0).toFixed(2);
                            },
                            title: 'Масса (кг)', width: "50px", orderable: true, searchable: false
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.dens !== null ? Number(row.dens).toFixed(4) : Number(0).toFixed(4);
                            },
                            title: 'Плотность (кг/м3)', width: "50px", orderable: true, searchable: false
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.dens15 !== null ? Number(row.dens15).toFixed(4) : Number(0).toFixed(4);
                            },
                            title: 'Плотность пр. к 15 гр. (кг/м3)', width: "50px", orderable: true, searchable: false
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.temp !== null ? Number(row.temp).toFixed(1) : Number(0).toFixed(1);
                            },
                            title: 'Температура', width: "50px", orderable: true, searchable: false
                        },
                        {
                            data: function (row, type, val, meta) {
                                return row.water_level !== null ? Number(row.water_level).toFixed(1) : Number(0).toFixed(1);
                            },
                            title: 'Уровень подт. воды', width: "50px", orderable: true, searchable: false
                        }
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
                            sheetName: 'Остатки бензола',
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
                if (!table_report.list || data_refresh === true || !table_report.date || table_report.date !== date_curent) {
                    // Обновим данные
                    bn.getRemainsTanksOfDate(
                        date_curent,
                        function (result) {
                            table_report.date = date_curent;
                            table_report.list = result ? result : [];
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
                table_report.obj.clear();
                table_report.obj.rows.add(data);
                LockScreenOff();
            },
        };

    // Инициализация
    panel_report.init();
    table_report.init();
    table_report.viewTable(true);
});