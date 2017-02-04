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

    public partial class Route
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Route()
        {
            this.tb_Customer = new HashSet<tb_Customer>();
        }
    
        public int Route_id { get; set; }
        public string Route_desc { get; set; }
        public string Name { get; set; }
        public string City { get; set; }
        public Nullable<int> Emoloyee { get; set; }
        public string EmployeeName { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tb_Customer> tb_Customer { get; set; }
        public virtual tb_Employee tb_Employee { get; set; }
        public IPagedList<Route> SearchResults { get; set; }
        public string SearchButton { get; set; }
        public int? Page { get; set; }
    }
}
