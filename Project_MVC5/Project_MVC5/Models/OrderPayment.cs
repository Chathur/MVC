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
    using System;
    using System.Collections.Generic;
    
    public partial class OrderPayment
    {
        public int OrderPaymentsId { get; set; }
        public Nullable<int> OrderNo { get; set; }
        public Nullable<decimal> CashAmount { get; set; }
        public Nullable<decimal> CardAmount { get; set; }
        public Nullable<decimal> ChequeAmount { get; set; }
        public Nullable<decimal> OtherAmount { get; set; }
        public Nullable<System.DateTime> DatePaid { get; set; }
        public Nullable<int> TakenBy { get; set; }
    }
}
