//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Project_MVC5.Models
{
    using PagedList;
    using System;
    using System.Collections.Generic;

    public partial class tb_Customer
    {
        public int ID_Customer { get; set; }
        public string Name_Customer { get; set; }
        public string Address_Customer { get; set; }
        public string Email { get; set; }
        public Nullable<decimal> CreditLimit { get; set; }
        public string Tel_Customer { get; set; }
        public int Route_Customer { get; set; }

        public IPagedList<tb_Customer> SearchResults { get; set; }
        public string SearchButton { get; set; }
        public int? Page { get; set; }

        public virtual Route Route { get; set; }
    }
}
