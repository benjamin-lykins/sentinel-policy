# CIS Policy Set for AWS Terraform

A comprehensive Sentinel policy library for enforcing CIS (Center for Internet Security) benchmarks and best practices on AWS infrastructure deployed via Terraform.

## Overview

This repository contains HashiCorp Sentinel policies designed to validate AWS Terraform configurations against security and compliance standards. The policies are organized by AWS service and can be applied at different enforcement levels for production and non-production environments.

## Repository Structure

```
.
├── modules/                    # Reusable Sentinel modules
│   ├── report/                # Policy reporting utilities
│   ├── tfconfig-functions/    # Terraform configuration helper functions
│   ├── tfplan-functions/      # Terraform plan helper functions
│   └── tfresources/           # Resource extraction utilities
├── policies/                  # Sentinel policy definitions
│   ├── aws/                   # AWS-specific policies
│   │   ├── cloudtrail/        # CloudTrail policies
│   │   ├── ec2/               # EC2 policies
│   │   ├── efs/               # EFS policies
│   │   ├── iam/               # IAM policies
│   │   ├── kms/               # KMS policies
│   │   ├── rds/               # RDS policies
│   │   ├── s3/                # S3 policies
│   │   ├── tags/              # Tagging policies
│   │   └── vpc/               # VPC policies
│   └── tfe/                   # Terraform Enterprise policies
└── policy_sets/               # Environment-specific policy sets
    ├── nprod/                 # Non-production (advisory enforcement)
    └── prod/                  # Production (hard-mandatory enforcement)
```

## Policy Categories

### CloudTrail
- Bucket access logging enabled
- CloudWatch Logs group ARN present
- Log file validation enabled
- Logs bucket not public
- Server-side encryption enabled

### EC2
- EBS encryption enabled
- IMDSv2 required for metadata
- Network ACL configuration
- Security group ingress restrictions (port and protocol)
- VPC default security group traffic restrictions
- VPC flow logging enabled

### EFS
- Encryption at rest enabled

### IAM
- No admin privileges allowed by policies
- No policies attached directly to users
- Password policy enforcement:
  - Password expiry
  - Minimum password length
  - Password complexity (lowercase, uppercase, numbers, symbols)
  - Password reuse prevention

### KMS
- Key rotation enabled

### RDS
- Encryption at rest enabled
- Minor version auto-upgrade enabled
- Public access disabled

### S3
- Block public access at account level
- Block public access at bucket level
- Object logging for events
- MFA delete required
- SSL/TLS required for connections

### Tags
- Required tags enforcement

## Policy Sets

This repository provides two policy set configurations:

### Non-Production (`policy_sets/nprod/`)
- **Enforcement Level**: `advisory`
- Policies generate warnings but do not block Terraform runs
- Ideal for development and testing environments

### Production (`policy_sets/prod/`)
- **Enforcement Level**: `hard-mandatory` (most policies)
- Policies block non-compliant Terraform runs
- Required tags policy set to `advisory`
- Suitable for production environments

## Usage

### With Terraform Cloud/Enterprise

1. Create a policy set in Terraform Cloud/Enterprise
2. Connect this repository as a VCS-backed policy set
3. Select the appropriate policy set directory:
   - `policy_sets/nprod/sentinel.hcl` for non-production workspaces
   - `policy_sets/prod/sentinel.hcl` for production workspaces
4. Assign the policy set to your workspaces

### Local Testing

To test policies locally using the Sentinel CLI:

```bash
# Navigate to a policy directory
cd policies/aws/ec2

# Run tests
sentinel test

# Test a specific policy
sentinel apply ec2-ebs-encryption-enabled.sentinel
```

## Modules

The repository includes reusable modules to simplify policy development:

- **report**: Utilities for generating policy violation reports
- **tfconfig-functions**: Functions for parsing Terraform configuration
- **tfplan-functions**: Functions for analyzing Terraform plans
- **tfresources**: Utilities for extracting resources from Terraform data

## Customization

### Modifying Required Tags

To update the list of required tags, edit [policies/aws/tags/required-tags.sentinel](policies/aws/tags/required-tags.sentinel):

```sentinel
required_tags = [
    "created_by", 
    "automate_by", 
    "contact_dll", 
    "env", 
    "mots_id"
]
```

### Adjusting Enforcement Levels

Edit the appropriate `sentinel.hcl` file in the policy_sets directory:

```hcl
policy "policy-name" {
  source = "./policies/aws/service/policy-name.sentinel"
  enforcement_level = "advisory"  # or "soft-mandatory" or "hard-mandatory"
}
```

## Enforcement Levels

- **advisory**: Policy failures generate warnings but do not prevent runs
- **soft-mandatory**: Policy failures prevent runs unless overridden
- **hard-mandatory**: Policy failures always prevent runs (no override possible)

## Testing

Each policy includes a `test/` directory with test cases. Tests validate policy behavior against various Terraform configurations.

Run all tests:
```bash
# From repository root
find policies -name "*.sentinel" -type f | while read policy; do
  dir=$(dirname "$policy")
  if [ -d "$dir/test" ]; then
    (cd "$dir" && sentinel test)
  fi
done
```

## Contributing

When adding new policies:

1. Place the policy in the appropriate service directory under `policies/aws/`
2. Include comprehensive test cases in a `test/` subdirectory
3. Add the policy to both `nprod` and `prod` policy sets with appropriate enforcement levels
4. Document the policy purpose and any configurable parameters

## Requirements

- HashiCorp Sentinel CLI (for local testing)
- Terraform Cloud or Terraform Enterprise (for policy enforcement)
- Terraform configurations using AWS provider

## License

[Specify your license here]

## Support

For questions or issues, please contact the infrastructure security team.
