using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cake_Project.MODEL
{
    public class Staff
    {
        private int id_staff;
        private string name_staff;
        private string email;
        private string address;
        private int number_phone;

        public Staff(int id_staff, string name_staff, string email, string address, int number_phone)
        {
            this.Id_staff = id_staff;
            this.Name_staff = name_staff;
            this.Email = email;
            this.Address = address;
            this.Number_phone = number_phone;
        }

        public Staff()
        {
        }

        public Staff(int id_staff, string name_staff)
        {
            this.id_staff = id_staff;
            this.name_staff = name_staff;
        }

        public Staff(string name_staff, string email, string address, int number_phone)
        {
            this.name_staff = name_staff;
            this.email = email;
            this.address = address;
            this.number_phone = number_phone;
        }

        public int Id_staff { get => id_staff; set => id_staff = value; }
        public string Name_staff { get => name_staff; set => name_staff = value; }
        public string Email { get => email; set => email = value; }
        public string Address { get => address; set => address = value; }
        public int Number_phone { get => number_phone; set => number_phone = value; }
    }
}