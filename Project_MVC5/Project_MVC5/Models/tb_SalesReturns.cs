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

    public partial class tb_SalesReturns
    {
        public int ID { get; set; }
        public int Bill_No { get; set; }
        public string Name_Item { get; set; }
        public int Quantity { get; set; }
        public Nullable<System.DateTime> Date_Returned { get; set; }
        public IPagedList<tb_SalesReturns> SearchResults { get; set; }
        public string SearchButton { get; set; }
        public int? Page { get; set; }
    }
}