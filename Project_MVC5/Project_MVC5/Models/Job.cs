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
    
    public partial class Job
    {
        public int job_id { get; set; }
        public int employee_id { get; set; }
        public System.DateTime Date { get; set; }
        public int route_id { get; set; }
    }
}