using Data.DB_Models;
using Services.IRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Services.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly IDbFactory dbFactory;
        private DB_MusicContext dbContext;

        public UnitOfWork(IDbFactory dbFactory)
        {
            this.dbFactory = dbFactory;
        }

        public DB_MusicContext DbContext
        {
            get { return dbContext ?? (dbContext = dbFactory.Init()); }
        }
        public async Task Commit()
        {
          await dbContext.SaveChangesAsync();
        }

        //public void Dispose()
        //{
        //    dbContext.Dispose();
        //}
    }
}
