variable "zone_id" {
    default = "Z03648111TBLN4B6M1MKR"
}
variable "aliases"  {
    default = { 
    alias1 = {
      name  = "www"
      records = "3.3.3.3"
    }
    alias2 = {
      name  = "ftp"
      records = "2.2.2.2"
    }
    alias3 = {
      name  = "box"
      records = "1.1.1.1"
    }
  }
}