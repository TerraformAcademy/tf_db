# How to Use
This module creates a data baricks workspace and cluster 
use this module as per below inputs, modify the source as per your source structure


```hcl
module "adf"{
    source   = "../ADF_MODULE"
    env      = "test"
    name_prefix      = "my-resource"
    location       = "Azure Region"
    rsg_name =  "my-rg"
    tags = {
        "env" = "test"
        "owner" = "abc"
    }

}
```