namespace MyInetShop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Attribute
    {
        public int Id { get; set; }

        public int AttributeTypeId { get; set; }

        [Required]
        [StringLength(50)]
        public string Value { get; set; }

        public int ProductId { get; set; }

        public virtual AttributeType AttributeType { get; set; }
    }
}
