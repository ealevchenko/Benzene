using EFBenzene.Abstract;
using EFBenzene.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFBenzene.Concrete.DC
{
    class EFRemains_Benzene : IRepository<Remains_Benzene>
    {
        private EFDCDbContext db;

        public EFRemains_Benzene(EFDCDbContext db)
        {

            this.db = db;
        }

        public Database Database
        {
            get { return this.db.Database; }
        }

        public IQueryable<Remains_Benzene> Context
        {
            get { return db.Remains_Benzene; }
        }

        public IEnumerable<Remains_Benzene> Get()
        {
            try
            {
                return db.Select<Remains_Benzene>();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return null;
            }
        }

        public Remains_Benzene Get(int id)
        {
            try
            {
                return db.Select<Remains_Benzene>(id);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return null;
            }
        }

        public void Add(Remains_Benzene item)
        {
            try
            {
                db.Insert<Remains_Benzene>(item);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        public void Update(Remains_Benzene item)
        {
            try
            {
                db.Update<Remains_Benzene>(item);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        public void AddOrUpdate(Remains_Benzene item)
        {
            try
            {
                Remains_Benzene dbEntry = db.Remains_Benzene.Find(item.id);
                if (dbEntry == null)
                {
                    Add(item);
                }
                else
                {
                    Update(item);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

        }

        public void Delete(int id)
        {
            try
            {
                Remains_Benzene item = db.Delete<Remains_Benzene>(id);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        public int Save()
        {
            try
            {
                return db.SaveChanges();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return -1;
            }
        }

        public Remains_Benzene Refresh(Remains_Benzene item)
        {
            try
            {
                db.Entry(item).State = EntityState.Detached;
                return db.Select<Remains_Benzene>(item.id);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return null;
            }
        }

        private bool disposed = false;

        public virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    db.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public void Add(IEnumerable<Remains_Benzene> items)
        {
            try
            {
                db.Inserts<Remains_Benzene>(items);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        public void Delete(IEnumerable<int> items)
        {
            try
            {
                db.Delete<Remains_Benzene>(items);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        public void Update(IEnumerable<Remains_Benzene> items)
        {
            try
            {
                db.Updates<Remains_Benzene>(items);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
