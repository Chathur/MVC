﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class WICKRAMA_STORESEntities : DbContext
    {
        public WICKRAMA_STORESEntities()
            : base("name=WICKRAMA_STORESEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<ITEM_TYPES_LOOKUP> ITEM_TYPES_LOOKUP { get; set; }
        public virtual DbSet<ITEMS> ITEMS { get; set; }
        public virtual DbSet<ITEMSS> ITEMSS { get; set; }
        public virtual DbSet<ItemTypes> ItemTypes { get; set; }
        public virtual DbSet<Job> Job { get; set; }
        public virtual DbSet<MANUFACTURER_LOOKUP> MANUFACTURER_LOOKUP { get; set; }
        public virtual DbSet<ORDER_STATUS_LOOKUP> ORDER_STATUS_LOOKUP { get; set; }
        public virtual DbSet<OrderElementsStatusLookup> OrderElementsStatusLookup { get; set; }
        public virtual DbSet<OrderPayments> OrderPayments { get; set; }
        public virtual DbSet<ORDERS> ORDERS { get; set; }
        public virtual DbSet<OrderStatusTypeLookup> OrderStatusTypeLookup { get; set; }
        public virtual DbSet<OrderTypes> OrderTypes { get; set; }
        public virtual DbSet<PaymentAccountAccountantTypes> PaymentAccountAccountantTypes { get; set; }
        public virtual DbSet<PaymentAccountHumanTypes> PaymentAccountHumanTypes { get; set; }
        public virtual DbSet<PaymentAccounts> PaymentAccounts { get; set; }
        public virtual DbSet<PaymentCardTransactions> PaymentCardTransactions { get; set; }
        public virtual DbSet<PaymentMethods> PaymentMethods { get; set; }
        public virtual DbSet<PaymentMethodTypes> PaymentMethodTypes { get; set; }
        public virtual DbSet<Payments> Payments { get; set; }
        public virtual DbSet<PaymentsSagePayCardTypes> PaymentsSagePayCardTypes { get; set; }
        public virtual DbSet<PaymentTerms> PaymentTerms { get; set; }
        public virtual DbSet<PaymentTransfers> PaymentTransfers { get; set; }
        public virtual DbSet<PaymentTypes> PaymentTypes { get; set; }
        public virtual DbSet<Permissions> Permissions { get; set; }
        public virtual DbSet<ProductInfo> ProductInfo { get; set; }
        public virtual DbSet<ProductLocations> ProductLocations { get; set; }
        public virtual DbSet<ProductsAllocatedToOrders> ProductsAllocatedToOrders { get; set; }
        public virtual DbSet<PurchaseDetails> PurchaseDetails { get; set; }
        public virtual DbSet<Purchases> Purchases { get; set; }
        public virtual DbSet<PurchaseStatus> PurchaseStatus { get; set; }
        public virtual DbSet<PurchaseTypes> PurchaseTypes { get; set; }
        public virtual DbSet<Route> Route { get; set; }
        public virtual DbSet<sales> sales { get; set; }
        public virtual DbSet<sales_order_detail> sales_order_detail { get; set; }
        public virtual DbSet<SUB_ITEM_TYPES_LOOKUP> SUB_ITEM_TYPES_LOOKUP { get; set; }
        public virtual DbSet<TaxRates> TaxRates { get; set; }
        public virtual DbSet<tb_Cart> tb_Cart { get; set; }
        public virtual DbSet<tb_Customer> tb_Customer { get; set; }
        public virtual DbSet<tb_employ> tb_employ { get; set; }
        public virtual DbSet<tb_Employee> tb_Employee { get; set; }
        public virtual DbSet<tb_Sales> tb_Sales { get; set; }
        public virtual DbSet<tb_SalesOrder> tb_SalesOrder { get; set; }
        public virtual DbSet<tb_Supplier> tb_Supplier { get; set; }
        public virtual DbSet<Users> Users { get; set; }
    }
}
