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

    public partial class tb_SalesOrder
    {
        public int Sales_order_id { get; set; }
        public string Employee { get; set; }
        public Nullable<System.DateTime> Delivery_date { get; set; }
        public string Customer { get; set; }
        public int Bill_No { get; set; }
        public System.DateTime Date { get; set; }
        public Nullable<int> item_id { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }
        public Nullable<decimal> Discount { get; set; }
        public string Code_Product { get; set; }
        public string Name_Product { get; set; }
        public double Total { get; set; }
        public string Route { get; set; }
        public IPagedList<tb_SalesOrder> SearchResults { get; set; }
        public string SearchButton { get; set; }
        public int? Page { get; set; }
    }
}
