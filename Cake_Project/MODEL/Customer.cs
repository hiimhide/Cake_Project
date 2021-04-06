using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cake_Project.MODEL
{
    public class Customer
    {
        private int id_customer;
        private string name_customer;
        private string email;
        private string address;
        private int number_phone;

        public Customer()
        {
        }

        public Customer(int id_customer, string name_customer, string email, string address, int number_phone)
        {
            this.id_customer = id_customer;
            this.name_customer = name_customer;
            this.email = email;
            this.address = address;
            this.number_phone = number_phone;
        }

        public Customer(int id_customer, string name_customer)
        {
            this.id_customer = id_customer;
            this.name_customer = name_customer;
        }


        public Customer(string name_customer, string email, string address, int number_phone)
        {
            this.name_customer = name_customer;
            this.email = email;
            this.address = address;
            this.number_phone = number_phone;
        }

        public int Id_customer { get => id_customer; set => id_customer = value; }
        public string Name_customer { get => name_customer; set => name_customer = value; }
        public string Email { get => email; set => email = value; }
        public string Address { get => address; set => address = value; }
        public int Number_phone { get => number_phone; set => number_phone = value; }
    }
}