using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using EFBenzene.Concrete;
using MessageLog;

namespace ReportBenzeneServices
{
    public partial class ReportService : ServiceBase
    {
        System.Timers.Timer timer_services = new System.Timers.Timer();

        public enum ServiceState
        {
            SERVICE_STOPPED = 0x00000001,
            SERVICE_START_PENDING = 0x00000002,
            SERVICE_STOP_PENDING = 0x00000003,
            SERVICE_RUNNING = 0x00000004,
            SERVICE_CONTINUE_PENDING = 0x00000005,
            SERVICE_PAUSE_PENDING = 0x00000006,
            SERVICE_PAUSED = 0x00000007,
        }

        private bool[] jobs = new bool[24] { false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false };

        private bool time_daily = false;

        [StructLayout(LayoutKind.Sequential)]
        public struct ServiceStatus
        {
            public long dwServiceType;
            public ServiceState dwCurrentState;
            public long dwControlsAccepted;
            public long dwWin32ExitCode;
            public long dwServiceSpecificExitCode;
            public long dwCheckPoint;
            public long dwWaitHint;
        };

        [DllImport("advapi32.dll", SetLastError = true)]
        private static extern bool SetServiceStatus(IntPtr handle, ref ServiceStatus serviceStatus);

        public ReportService()
        {
            InitializeComponent();
            //// Настроем таймер контроля выполнения сервиса
            timer_services.Interval = 1000 * 60; // 1 раз в минуту
            timer_services.Elapsed += new System.Timers.ElapsedEventHandler(this.OnTimerServices);
        }

        protected override void OnStart(string[] args)
        {
            // Update the service state to Start Pending.
            ServiceStatus serviceStatus = new ServiceStatus();
            serviceStatus.dwCurrentState = ServiceState.SERVICE_START_PENDING;
            serviceStatus.dwWaitHint = 100000;
            SetServiceStatus(this.ServiceHandle, ref serviceStatus);
            // Запустить таймер контроля сервиса
            timer_services.Start();
            String.Format("Сервис ReportBenzeneServices - старт").SaveInformation();

            // Update the service state to Running.
            serviceStatus.dwCurrentState = ServiceState.SERVICE_RUNNING;
            SetServiceStatus(this.ServiceHandle, ref serviceStatus);
        }

        protected override void OnStop()
        {
            timer_services.Stop();
            String.Format("Сервис ReportBenzeneServices - стоп").SaveInformation();
        }

        public void OnTimerServices(object sender, System.Timers.ElapsedEventArgs args)
        {
            try
            {
                //String.Format("Сервис ReportBenzeneServices - сработал таймер OnTimerServices").SaveWarning();
                string log_mes;
                DateTime dt = DateTime.Now;
                int h = dt.Hour;
                int m = dt.Minute;
                //  В 0:5 сбосить тригеры отработки заданий
                if (h == 0 && (m >= 0 && m <= 2))
                {
                    // обнулим события
                    for (int i = 0; i < 24; i++)
                    {
                        jobs[i] = false;
                    }
                    time_daily = false;
                    String.Format("Сервис ReportBenzeneServices, тригеры отработки заданий - сброшены.").SaveWarning();
                }
                // Сработка события каждый час
                if (!jobs[h] && (m >= 5 && m <= 6))
                {
                    jobs[h] = true;
                    log_mes = String.Format("Сервис ReportBenzeneServices - сработал таймер на {0} часов", h);
                    log_mes.SaveWarning();

                    if (h == 0) {
                        // Выполнить ХП перенса суточного отчета
                        EFWEBDbContext ef_web = new EFWEBDbContext();
                        try
                        {
                            string sql = "EXEC [dbo].[Transfer_Daily_Report_Benzene]";
                            int res = ef_web.Database.ExecuteSqlCommand(sql);
                            String.Format("ХП [dbo].[Transfer_Daily_Report_Benzene] - выполнена, перенесено {0} строк", res).SaveWarning();
                        }
                        catch (Exception e)
                        {
                            String.Format("Ошибка выполнения ХП [dbo].[Transfer_Daily_Report_Benzene]").SaveError(e);
                        }
                    }
                    //
                    // Выполнить ХП перенса остатков каждый час
                    EFTanksDbContext ef_tanks = new EFTanksDbContext();
                    try
                    {
                        string sql = "EXEC [dbo].[Transfer_Remains_Benzene]";
                        int res = ef_tanks.Database.ExecuteSqlCommand(sql);
                        String.Format("ХП [dbo].[Transfer_Remains_Benzene] - выполнена, перенесено {0} строк", res).SaveWarning();
                    }
                    catch (Exception e)
                    {
                        String.Format("Ошибка выполнения ХП [dbo].[Transfer_Remains_Benzene]").SaveError(e);
                    }

                }

                //if (h == 1 && (m >= 5 && m <= 6) && !time_daily)
                //{
                //    String.Format("Сервис ReportBenzeneServices - сработал таймер на 0 часов").SaveInformation();

                //    //int res = 0;
                //    // Суточный с пересчетом к 15 градусам
                //    //res = ef_dar.AddDailyAccountingReport();
                //    //log_mes = String.Format("Сервис ReportTRKServices - Отработал метод AddDaily_Accounting_Report - Код выполнения:{0}", res);
                //    //log_mes.SaveInformation();
                //    //trk_log.AddTRKLogs(new TRKLogs()
                //    //{
                //    //    ID = 0,
                //    //    DateTime = DateTime.Now,
                //    //    Level = 4,
                //    //    UserName = "ReportTRKServeces",
                //    //    Log = log_mes
                //    //});
                //    //// Суточный детально по емкостям
                //    //res = ef_adr.AddDailyAccountingDetaliReport();
                //    //log_mes = String.Format("Сервис ReportTRKServices - Отработал метод AddDaily_Accounting_Detali_Report - Код выполнения:{0}", res);
                //    //log_mes.SaveInformation();
                //    //trk_log.AddTRKLogs(new TRKLogs()
                //    //{
                //    //    ID = 0,
                //    //    DateTime = DateTime.Now,
                //    //    Level = 4,
                //    //    UserName = "ReportTRKServeces",
                //    //    Log = log_mes
                //    //});

                //    //// Суточный с переносом в ЦОД
                //    //int res_rt = tr.RemainsTanksToDC();
                //    //int res_rect = tr.ReceivingTanksToDC();
                //    //int res_dt = tr.DeliveryTanksToDC();
                //    //int res_radr = tr.Daily_Accounting_Detali_ReportToDC();
                //    //int res_dar = tr.Daily_Accounting_ReportToDC();

                //    //log_mes = String.Format("Сервис ReportTRKServices - Отработали методы переноса в ЦОД - Коды выполнения RemainsTanksToDC:{0}, ReceivingTanksToDC:{1}, DeliveryTanksToDC:{2}, Daily_Accounting_Detali_ReportToDC:{3}, Daily_Accounting_ReportToDC:{4}",
                //    //    res_rt, res_rect, res_dt, res_radr, res_dar);
                //    //log_mes.SaveInformation();
                //    //trk_log.AddTRKLogs(new TRKLogs()
                //    //{
                //    //    ID = 0,
                //    //    DateTime = DateTime.Now,
                //    //    Level = 4,
                //    //    UserName = "ReportTRKServeces",
                //    //    Log = log_mes
                //    //});
                //    //// Чистка базы
                //    //res = ef_tl.Delete_Tanks();
                //    //log_mes = String.Format("Сервис ReportTRKServices - Отработал метод Delete_Tanks - Код выполнения:{0}", res);
                //    //log_mes.SaveInformation();
                //    //trk_log.AddTRKLogs(new TRKLogs()
                //    //{
                //    //    ID = 0,
                //    //    DateTime = DateTime.Now,
                //    //    Level = 4,
                //    //    UserName = "ReportTRKServeces",
                //    //    Log = log_mes
                //    //});
                //    time_daily = true;
                //}
                //if (h == 6 && (m >= 58 && m <= 59) && !time_sm_day)
                //{
                //    log_mes = String.Format("Сервис ReportTRKServices - сработал таймер на 7 часов");
                //    log_mes.SaveInformation();
                //    trk_log.AddTRKLogs(new TRKLogs()
                //    {
                //        ID = 0,
                //        DateTime = DateTime.Now,
                //        Level = 4,
                //        UserName = "ReportTRKServeces",
                //        Log = log_mes
                //    });
                //    addCounters();
                //    time_sm_day = true;
                //}
                //if (h == 18 && (m >= 58 && m <= 59) && !time_sm_night)
                //{
                //    log_mes = String.Format("Сервис ReportTRKServices - сработал таймер на 19 часов");
                //    log_mes.SaveInformation();
                //    trk_log.AddTRKLogs(new TRKLogs()
                //    {
                //        ID = 0,
                //        DateTime = DateTime.Now,
                //        Level = 4,
                //        UserName = "ReportTRKServeces",
                //        Log = log_mes
                //    });
                //    addCounters();
                //    time_sm_night = true;
                //}
                //if (h == 23 && (time_daily || time_sm_day || time_sm_night))
                //{
                //    time_daily = false;
                //    //time_sm_day = false;
                //    //time_sm_night = false;
                //}
            }
            catch (Exception e)
            {
                string log_mes = String.Format("OnTimerServices(sender={0}, args={1})", sender, args.ToString());
                log_mes.SaveError(e);
            }
        }
    }
}
