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
    
    public partial class PaymentMethods
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PaymentMethods()
        {
            this.Payments = new HashSet<Payments>();
        }
    
        public int PaymentMethodsId { get; set; }
        public string PaymentMethod { get; set; }
        public bool Active { get; set; }
        public Nullable<int> PaymentMethodType { get; set; }
        public Nullable<bool> ShowInPOS { get; set; }
        public Nullable<int> RowOrder { get; set; }
    
        public virtual PaymentMethodTypes PaymentMethodTypes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Payments> Payments { get; set; }
    }
}
