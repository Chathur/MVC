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
    
    public partial class OrderStatusTypeLookup
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OrderStatusTypeLookup()
        {
            this.ORDER_STATUS_LOOKUP = new HashSet<ORDER_STATUS_LOOKUP>();
        }
    
        public int OrderStatusTypeId { get; set; }
        public string OrderStatusType { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ORDER_STATUS_LOOKUP> ORDER_STATUS_LOOKUP { get; set; }
    }
}
