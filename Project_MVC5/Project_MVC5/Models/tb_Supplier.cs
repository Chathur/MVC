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

    public partial class tb_Supplier
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tb_Supplier()
        {
            this.Purchases = new HashSet<Purchase>();
        }
    
        public int ID_Supplier { get; set; }
        public string Name_Supplier { get; set; }
        public string Store_Supplier { get; set; }
        public string Address_Supplier { get; set; }
        public string ADDRESS_3 { get; set; }
        public string TOWN { get; set; }
        public string COUNTY { get; set; }
        public string POST_CODE { get; set; }
        public string COUNTRY { get; set; }
        public string Tel_Supplier { get; set; }
        public string FAX_NO { get; set; }
        public string CONTACT_NAME { get; set; }
        public string CONTACT_TEL { get; set; }
        public string CONTACT_FAX { get; set; }
        public string CONTACT_EMAIL { get; set; }
        public string WEB_ADDRESS { get; set; }
        public string ACCOUNT_NO { get; set; }
        public Nullable<bool> CREDIT_ACCOUNT { get; set; }
        public string NOTES { get; set; }
        public Nullable<decimal> CreditLimit { get; set; }
        public Nullable<int> PaymentTermsId { get; set; }

        public IPagedList<tb_Supplier> SearchResults { get; set; }
        public string SearchButton { get; set; }
        public int? Page { get; set; }

        public virtual PaymentTerms PaymentTerms { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Purchases> Purchases { get; set; }
    }
}
