variable "zone_id" {
    default = "Z03648111TBLN4B6M1MKR"
}
variable "aliases"  {
    default = { 
    alias1 = {
      name  = "www"
      records = "6.6.6.6"
    }
    alias2 = {
      name  = "ftp"
      records = "7.7.7.7"
    }
    alias3 = {
      name  = "box"
      records = "8.8.8.8"
    }
  }
}