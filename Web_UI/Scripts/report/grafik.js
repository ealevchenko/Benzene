// Загрузка документа
$(document).ready(function () {
    var date_curent = moment().set({ 'hour': 0, 'minute': 0, 'second': 0, 'millisecond': 0 }),
        date_start = moment().set({ 'hour': 7, 'minute': 0, 'second': 0, 'millisecond': 0 })._d,
        date_stop = moment().set({ 'hour': 18, 'minute': 59, 'second': 59, 'millisecond': 0 })._d,
        bn = new BENZENE_API(), // Создадим класс TSK_API
        panel_report = {
            bt_left: $('button#bt-left'),
            bt_right: $('button#bt-right'),
            select_sm: $('select#select-smena'),
            select_tank: $('select#select-tanks'),
            //span_range_date: $('span#select-range-date'),
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
                // Настроим выбор времени
                panel_report.select_tank = cd_initSelect(
                    panel_report.select_tank,
                    { width: 200 },
                    [
                        { value: 1, text: "Т1" },
                        { value: 2, text: "Т2" },
                    ],
                    null,
                    1,
                    function (event, ui) {
                        event.preventDefault();
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
                        //panel_report.select_sm.prop('disabled', false);
                        //panel_report.bt_left.prop('disabled', false);
                        //panel_report.bt_right.prop('disabled', false);
                    });
                // Выставим текущую дату
                panel_report.obj_date.data('dateRangePicker').setDateRange(moment(date_curent).format('DD.MM.YYYY HH:mm:'), moment(date_curent).format('DD.MM.YYYY HH:mm:'), true);
                // настроим компонент выбора времени
                //panel_report.obj_date_range = panel_report.span_range_date.dateRangePicker(
                //    {
                //        language: 'ru',
                //        format: 'DD.MM.YYYY HH:mm',
                //        separator: '-',
                //        autoClose: false,
                //        time: {
                //            enabled: true
                //        },
                //        setValue: function (s, s1, s2) {
                //            panel_report.input_data_start.val(s1);
                //            panel_report.input_data_stop.val(s2);

                //        }
                //    }).
                //    bind('datepicker-change', function (evt, obj) {
                //        date_start = obj.date1;
                //        date_stop = obj.date2;
                //    })
                //    .bind('datepicker-closed', function () {
                //        trend_tank.view(true);
                //        panel_report.select_sm.prop('disabled', true);
                //        panel_report.bt_left.prop('disabled', true);
                //        panel_report.bt_right.prop('disabled', true);
                //    });
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
                //panel_report.obj_date_range.data('dateRangePicker').setDateRange(moment(date_start).format('DD.MM.YYYY HH:mm:'), moment(date_stop).format('DD.MM.YYYY HH:mm:'), true);
                trend_tank.view(true);
            }
        },
        // График
        trend_tank = {
            chart: null,
            table: null,
            list: null,
            type_fuel: null,
            num: null,
            start: null,
            stop: null,
            // Инициализация графика
            initTrend: function () {
                am4core.ready(function () {

                    // Themes begin
                    am4core.useTheme(am4themes_animated);
                    // Themes end

                    // Create chart instance
                    trend_tank.chart = am4core.create("chartdiv", am4charts.XYChart);

                    // Increase contrast by taking evey second color
                    //trend_tank.chart.colors.step = 2;

                    trend_tank.chart.colors.list = [
                        //am4core.color("#0026ff"),
                        //am4core.color("#ff6a00"),
                        //am4core.color("#ff0000"),
                        //am4core.color("#b200ff"),
                        //am4core.color("#000000"),
                        //am4core.color("#0c7a1a"),
                    ];


                    // Add data
                    //this.chart.data = trend_tank.generateChartData();
                    //this.chart.data = [];
                    // Create axes
                    var dateAxis = trend_tank.chart.xAxes.push(new am4charts.DateAxis());
                    dateAxis.renderer.minGridDistance = 50;

                    // Create series
                    function createAxisAndSeries(field, name, opposite, bullet) {
                        var valueAxis = trend_tank.chart.yAxes.push(new am4charts.ValueAxis());
                        switch (field) {
                            case "level":
                                valueAxis.min = 0;
                                valueAxis.max = 3800;//3000
                                break;
                            case "volume":
                                valueAxis.min = 0;
                                valueAxis.max = 200000; //80000
                                break;
                            case "volume15":
                                valueAxis.min = 0;
                                valueAxis.max = 200000; //80000
                                break;
                            case "dens":
                                valueAxis.min = 700;
                                valueAxis.max = 1000;
                                break;
                            case "dens15":
                                valueAxis.min = 700;
                                valueAxis.max = 1000;
                                break;
                            case "mass":
                                valueAxis.min = 0;
                                valueAxis.max = 200000;
                                break;
                            case "temp":
                                valueAxis.min = -20;
                                valueAxis.max = 50;
                                break;
                            case "water_level":
                                valueAxis.min = 0;
                                break;
                        }
                        if (field === "water_level" || field === "volume") valueAxis.min = 0;

                        var series = trend_tank.chart.series.push(new am4charts.LineSeries());
                        series.dataFields.valueY = field;
                        series.dataFields.dateX = "date";
                        series.strokeWidth = 1;
                        series.yAxis = valueAxis;
                        series.name = name;
                        series.tooltipText = "{name}: [bold]{valueY}[/]";
                        series.tensionX = 0.8;
                        //series.legendSettings.valueText = "{valueY.close}";
                        series.legendSettings.itemValueText = "[bold]{valueY}[/bold]";

                        var interfaceColors = new am4core.InterfaceColorSet();

                        //switch (bullet) {
                        //    case "triangle":
                        //        var bullet = series.bullets.push(new am4charts.Bullet());
                        //        bullet.width = 5;
                        //        bullet.height = 5;
                        //        bullet.horizontalCenter = "middle";
                        //        bullet.verticalCenter = "middle";

                        //        var triangle = bullet.createChild(am4core.Triangle);
                        //        triangle.stroke = interfaceColors.getFor("background");
                        //        triangle.strokeWidth = 1;
                        //        triangle.direction = "top";
                        //        triangle.width = 5;
                        //        triangle.height = 5;
                        //        break;
                        //    case "rectangle":
                        //        var bullet = series.bullets.push(new am4charts.Bullet());
                        //        bullet.width = 5;
                        //        bullet.height = 5;
                        //        bullet.horizontalCenter = "middle";
                        //        bullet.verticalCenter = "middle";

                        //        var rectangle = bullet.createChild(am4core.Rectangle);
                        //        rectangle.stroke = interfaceColors.getFor("background");
                        //        rectangle.strokeWidth = 1;
                        //        rectangle.width = 5;
                        //        rectangle.height = 5;
                        //        break;
                        //    default:
                        //        var bullet = series.bullets.push(new am4charts.CircleBullet());
                        //        bullet.circle.stroke = interfaceColors.getFor("background");
                        //        bullet.circle.strokeWidth = 1;
                        //        break;
                        //}

                        valueAxis.renderer.line.strokeOpacity = 1;
                        valueAxis.renderer.line.strokeWidth = 1;
                        valueAxis.renderer.line.stroke = series.stroke;
                        valueAxis.renderer.labels.template.fill = series.stroke;
                        valueAxis.renderer.opposite = opposite;
                        valueAxis.renderer.grid.template.disabled = true;
                    }

                    createAxisAndSeries("level", "Уровень (мм)", false, "circle");
                    createAxisAndSeries("volume", "Объем (л)", false, "triangle");
                    createAxisAndSeries("volume15", "Объем (л)", false, "triangle");
                    createAxisAndSeries("dens", "Плотность (кг/м3)", true, "rectangle");
                    createAxisAndSeries("dens15", "Плотность (кг/м3)", true, "rectangle");
                    createAxisAndSeries("mass", "Масса (кг)", false, "rectangle");
                    createAxisAndSeries("temp", "Температура (град. С)", true, "rectangle");
                    createAxisAndSeries("water_level", "Уровень подт. вод. (мм)", true, "rectangle");
                    // Add legend
                    //trend_tank.chart.legend = new am4charts.Legend();

                    trend_tank.chart.legend = new am4charts.Legend();
                    trend_tank.chart.legend.useDefaultMarker = true;
                    var marker = trend_tank.chart.legend.markers.template.children.getIndex(0);
                    marker.cornerRadius(12, 12, 12, 12);
                    marker.strokeWidth = 2;
                    marker.strokeOpacity = 1;
                    marker.stroke = am4core.color("#ccc");

                    // Add cursor
                    trend_tank.chart.cursor = new am4charts.XYCursor();

                    // generate some random data, quite different range


                }); // end am4core.ready()
            },

            view: function () {
                var num = panel_report.select_tank.val();

                if (num === "-1") return;

                if (!trend_tank.list || num !== trend_tank.num || Date.parse(date_start) !== Date.parse(trend_tank.start) || Date.parse(date_stop) !== Date.parse(trend_tank.stop)) {
                    LockScreen('Мы формируем ваш график...');
                    trend_tank.num = num;
                    if (num === "1") {
                        bn.getValueTanks1OfInterval(
                            date_start,
                            date_stop,
                            function (data) {
                                trend_tank.view_trend(data);
                                LockScreenOff();
                            });
                    }
                    if (num === "2") {
                        bn.getValueTanks2OfInterval(
                            date_start,
                            date_stop,
                            function (data) {
                                trend_tank.view_trend(data);
                                LockScreenOff();
                            });
                    }

                } else {
                    //trend_tank.viewTrend();
                }
            },

            view_trend: function (data) {
                trend_tank.list = [];
                for (i = 0; i < data.length; i++) {
                    trend_tank.list.push({
                        date: Date.parse(data[i].dt),
                        level: data[i].level,
                        volume: data[i].Volume,
                        volume15: data[i].Volume15,
                        dens: data[i].dens,
                        dens15: data[i].dens15,
                        mass: data[i].mass,
                        temp: data[i].temp,
                        water_level: data[i].water_level,

                    });
                }
                trend_tank.start = date_start;
                trend_tank.stop = date_stop;

                // Обновим график
                trend_tank.chart.data = trend_tank.list;


                //trend_tank.table.clear();
                //for (it = 0; it < trend_tank.list.length; it++) {
                //    trend_tank.table.row.add({
                //        //"date": toISOStringTZ(trend_tank.list[i].date),
                //        "dt": toISOStringTZ(new Date(trend_tank.list[it].date)),
                //        //"dt": toISOStringTZ(trend_tank.list[it].date),
                //        "level": trend_tank.list[it].level,
                //        "volume": trend_tank.list[it].volume,
                //        "dens": trend_tank.list[it].dens,
                //        "mass": trend_tank.list[it].mass,
                //        "temp": trend_tank.list[it].temp,
                //        "water_level": trend_tank.list[it].water_level

                //    });
                //}
                //trend_tank.table.draw(true);
                //LockScreenOff();

                //if (typeof callback === 'function') {
                //    callback();
                //}
            }
        };

    // Инициализация
    panel_report.init();
    trend_tank.initTrend();
    //table_report.init();
    trend_tank.view(true);
});