namespace MyInetShop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }

        public int CustomerId { get; set; }

        public int? ManagerId { get; set; }

        public int? DeliveryTypeId { get; set; }

        public int? PaymentTypeId { get; set; }

        public double TotalCost { get; set; }

        [StringLength(100)]
        public string Description { get; set; }

        [StringLength(100)]
        public string Comment { get; set; }

        public DateTime OrderDate { get; set; }

        public DateTime? ShipDate { get; set; }

        public DateTime? DeliveryDate { get; set; }

        [StringLength(30)]
        public string LadingNumber { get; set; }

        [Required]
        [StringLength(1)]
        public string Status { get; set; }

        [Required]
        [StringLength(1)]
        public string StatusPayment { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual DeliveryType DeliveryType { get; set; }

        public virtual Manager Manager { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        public virtual PaymentType PaymentType { get; set; }
    }
}
