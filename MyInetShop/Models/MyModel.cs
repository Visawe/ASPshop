namespace MyInetShop.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MyModel : DbContext
    {
        public MyModel()
            : base("name=MyModel")
        {
        }

        public virtual DbSet<Attribute> Attributes { get; set; }
        public virtual DbSet<AttributeType> AttributeTypes { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<ContactType> ContactTypes { get; set; }
        public virtual DbSet<CurrencyRate> CurrencyRates { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<DeliveryType> DeliveryTypes { get; set; }
        public virtual DbSet<Image> Images { get; set; }
        public virtual DbSet<Manager> Managers { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<PaymentType> PaymentTypes { get; set; }
        public virtual DbSet<Person> Persons { get; set; }
        public virtual DbSet<Producer> Producers { get; set; }
        public virtual DbSet<Product> Products { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AttributeType>()
                .HasMany(e => e.Categories)
                .WithMany(e => e.AttributeTypes)
                .Map(m => m.ToTable("Category_AttributeType").MapLeftKey("AttributeTypesId").MapRightKey("CategoryId"));

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Subcategories)
                .WithOptional(e => e.ParentCategory)
                .HasForeignKey(e => e.ParentCategoryId);
        }
    }
}
