# vpc_ipam_test

Provisioning a VPC using an IPAM Pool

Then import the VPC and try to provision

## Provision

```
terraform init
terraform apply
```
Save `vpc_id` from `Outputs` of apply. Use this in the next step:

`VPC_ID="vpc-122523421532"`

## Test import

```
cd import
terraform init
terraform import aws_vpc.test $VPC_ID
terraform apply
```

```

```


## Cleanup 

```
cd ..
terraform destroy
```