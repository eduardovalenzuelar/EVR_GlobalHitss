//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaDatos.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class CLIENTES
    {
        public long dbid { get; set; }

        [Display (Name ="Tipo de Identificacion")]
        [Required]
        public long dbidTipoIdentificacion { get; set; }
        [Required]
        [RegularExpression("^[a-zA-Z ]+$")]
        public string Nombre { get; set; }
        
        [Display(Name = "Numero Identificacion")]
        [Required]
        public string Numero_identificacion { get; set; }
        [Required]
        [Display(Name = "Correo Electronico")]
        [EmailAddress]
        public string email { get; set; }
        [Required]
        public long Movil { get; set; }
        [Required]
        public string Direccion { get; set; }
        [Display(Name = "Direccion de Instalacion")]
        [Required]
        public string Direccion_Instalacion { get; set; }
        public Nullable<System.DateTime> Fechacreacion { get; set; }
        public Nullable<System.DateTime> FechaModificacion { get; set; }
        [Display(Name = "Activo / Inactivo")]
        public int Estado { get; set; }

        [Display(Name = "Tipo de Identificacion")]
        [Required]
        public virtual TIPO_IDENTIFICACION TIPO_IDENTIFICACION { get; set; }
    }
}
