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

    public partial class Employee
    {
        public int Employee_id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Telephone { get; set; }
        public string email { get; set; }
        public string Job_tile { get; set; }
        public string Salary { get; set; }
        public string Joining_Date { get; set; }
        public string user_id { get; set; }
        public bool Still_working { get; set; }
        public IPagedList<Employee> SearchResults { get; set; }
        public string SearchButton { get; set; }
        public int? Page { get; set; }
    }
}