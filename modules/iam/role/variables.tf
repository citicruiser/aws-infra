variable name    {type = "string", description = "role name"}
variable service {type = "string", description = "aws service name"}
variable tags    {type = "map" , default = {}}
variable trust   {default = "", description = "trust relationship json"}

variable policy-arns  {type = "list", default = [], description = "customer managed policy arns"}
variable policies-aws {type = "list", default = [], description = "aws managed policy names"}
