namespace MyInetShop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Image
    {
        public int Id { get; set; }

        [Required]
        [StringLength(247)]
        public string Path { get; set; }

        public int ProductId { get; set; }

        public virtual Product Product { get; set; }
    }
}
