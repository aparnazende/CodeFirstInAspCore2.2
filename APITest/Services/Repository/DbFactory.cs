using Data.DB_Models;
using Services.IRepository;
using System;
using System.Collections.Generic;
using System.Text;

namespace Services.Repository
{
  public  class DbFactory : Disposable, IDbFactory
    {
        DB_MusicContext dbContext;

        public DB_MusicContext Init()
        {
            return dbContext ?? (dbContext = new DB_MusicContext());
        }

        protected override void DisposeCore()
        {
            if (dbContext != null)
                dbContext.Dispose();
        }
    }
}
