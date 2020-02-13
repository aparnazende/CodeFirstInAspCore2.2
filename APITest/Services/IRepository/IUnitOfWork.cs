using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Services.IRepository
{
    public interface IUnitOfWork 
    {
        Task Commit();
    }
}
