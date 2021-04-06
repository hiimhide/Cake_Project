using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cake_Project.MODEL
{
    public class Product
    {
        private int id_product;
        private string name_product;
        private int price;
        private string descride;
        private int discount;
        private string date_start;
        private string date_end;
        private string images;

        public int Id_product { get => id_product; set => id_product = value; }
        public string Name_product { get => name_product; set => name_product = value; }
        public int Price { get => price; set => price = value; }
        public string Descride { get => descride; set => descride = value; }
        public int Discount { get => discount; set => discount = value; }
        public string Date_start { get => date_start; set => date_start = value; }
        public string Date_end { get => date_end; set => date_end = value; }
        public string Images { get => images; set => images = value; }

        public Product()
        {
        }

        public Product(int id_product, string name_product, int price,string descride, int discount, string date_start, string date_end, string images)
        {
            this.id_product = id_product;
            this.name_product = name_product;
            this.price = price;
            this.descride = descride;
            this.discount = discount;
            this.date_start = date_start;
            this.date_end = date_end;
            this.images = images;
        }

        public Product(string name_product, int price, string descride, int discount, string date_start, string date_end, string images)
        {
            this.name_product = name_product;
            this.price = price;
            this.descride = descride;
            this.discount = discount;
            this.date_start = date_start;
            this.date_end = date_end;
            this.images = images;
        }

        public Product(int id_product, string name_product, int price)
        {
            this.id_product = id_product;
            this.name_product = name_product;
            this.price = price;
        }

        
    }
}