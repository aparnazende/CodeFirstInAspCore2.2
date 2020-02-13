using Data.DB_Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Services.IRepository
{
   public interface IDbFactory : IDisposable
    {
        DB_MusicContext Init();
    }
}
