resource "aws_route53_record" "alias_records" {
  for_each  =  var.aliases
  zone_id   = "Z03648111TBLN4B6M1MKR"
  name      = each.value.name
  type      = "A"
  ttl       = "300"
  records   = [each.value.records]
}

// resource "aws_route53_record" "alias_records" {
//   for_each = var.aliases
//   zone_id  = "Z03648111TBLN4B6M1MKR"
//   name     = each.key
//   type     = "A"

//   alias {
//     zone_id                = each.value.zone_id
//     name                   = each.value.dns_name
//     evaluate_target_health = false
//   }
// }