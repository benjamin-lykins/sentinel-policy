import "module" "report" {
  source = "./modules/report/report.sentinel"
}

import "module" "tfresources" {
  source = "./modules/tfresources/tfresources.sentinel"
}

import "module" "tfplan-functions" {
  source = "./modules/tfplan-functions/tfplan-functions.sentinel"
}

import "module" "tfconfig-functions" {
  source = "./modules/tfconfig-functions/tfconfig-functions.sentinel"
}

policy "required-tags" {
  source = "./policies/aws/tags/required-tags.sentinel"
  enforcement_level = "advisory"
}

policy "rds-encryption-at-rest-enabled" {
  source = "./policies/aws/rds/rds-encryption-at-rest-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "rds-minor-version-upgrade-enabled" {
  source = "./policies/aws/rds/rds-minor-version-upgrade-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "rds-public-access-disabled" {
  source = "./policies/aws/rds/rds-public-access-disabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "kms-key-rotation-enabled" {
  source = "./policies/aws/kms/kms-key-rotation-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "ec2-ebs-encryption-enabled" {
  source = "./policies/aws/ec2/ec2-ebs-encryption-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "ec2-network-acl" {
  source = "./policies/aws/ec2/ec2-network-acl.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "ec2-vpc-flow-logging-enabled" {
  source = "./policies/aws/ec2/ec2-vpc-flow-logging-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "ec2-vpc-default-security-group-no-traffic" {
  source = "./policies/aws/ec2/ec2-vpc-default-security-group-no-traffic.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "ec2-metadata-imdsv2-required" {
  source = "./policies/aws/ec2/ec2-metadata-imdsv2-required.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "ec2-security-group-ipv4-ingress-traffic-restriction" {
  source = "./policies/aws/ec2/ec2-security-group-ingress-traffic-restriction-protocol.sentinel"
  enforcement_level = "hard-mandatory"
  params = {
    prevent_unknown_ipv4_ingress = true
  }
}

policy "ec2-security-group-ipv6-ingress-traffic-restriction" {
  source = "./policies/aws/ec2/ec2-security-group-ingress-traffic-restriction-protocol.sentinel"
  enforcement_level = "hard-mandatory"
  params = {
    prevent_unknown_ipv6_ingress = true
    prevent_unknown_ipv4_ingress = false
  }
}

policy "ec2-security-group-ingress-traffic-restriction-port-22" {
  source = "./policies/aws/ec2/ec2-security-group-ingress-traffic-restriction-port.sentinel"
  enforcement_level = "hard-mandatory"
  params = {
    port = 22
  }
}

policy "ec2-security-group-ingress-traffic-restriction-port-3389" {
  source = "./policies/aws/ec2/ec2-security-group-ingress-traffic-restriction-port.sentinel"
  enforcement_level = "hard-mandatory"
  params = {
    port = 3389
  }
}

policy "efs-encryption-at-rest-enabled" {
  source = "./policies/aws/efs/efs-encryption-at-rest-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "vpc-flow-logging-enabled" {
  source = "./policies/aws/vpc/vpc-flow-logging-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "s3-block-public-access-account-level" {
  source = "./policies/aws/s3/s3-block-public-access-account-level.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "s3-block-public-access-bucket-level" {
  source = "./policies/aws/s3/s3-block-public-access-bucket-level.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "s3-require-mfa-delete" {
  source = "./policies/aws/s3/s3-require-mfa-delete.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "s3-require-ssl" {
  source = "./policies/aws/s3/s3-require-ssl.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "s3-enable-object-logging-for-write-events" {
  source = "./policies/aws/s3/s3-enable-object-logging-for-events.sentinel"
  enforcement_level = "hard-mandatory"
  params = {
    event_type = "WriteOnly"
  }
}

policy "s3-enable-object-logging-for-read-events" {
  source = "./policies/aws/s3/s3-enable-object-logging-for-events.sentinel"
  enforcement_level = "hard-mandatory"
  params = {
    event_type = "ReadOnly"
  }
}


policy "cloudtrail-server-side-encryption-enabled" {
  source = "./policies/aws/cloudtrail/cloudtrail-server-side-encryption-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "cloudtrail-log-file-validation-enabled" {
  source = "./policies/aws/cloudtrail/cloudtrail-log-file-validation-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "cloudtrail-cloudwatch-logs-group-arn-present" {
  source = "./policies/aws/cloudtrail/cloudtrail-cloudwatch-logs-group-arn-present.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "cloudtrail-logs-bucket-not-public" {
  source = "./policies/aws/cloudtrail/cloudtrail-logs-bucket-not-public.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "cloudtrail-bucket-access-logging-enabled" {
  source = "./policies/aws/cloudtrail/cloudtrail-bucket-access-logging-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "iam-no-admin-privileges-allowed-by-policies" {
  source = "./policies/aws/iam/iam-no-admin-privileges-allowed-by-policies.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "iam-no-policies-attached-to-users" {
  source = "./policies/aws/iam/iam-no-policies-attached-to-users.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "iam-password-expiry" {
  source = "./policies/aws/iam/iam-password-expiry.sentinel"
  enforcement_level = "hard-mandatory"
  params = {
    password_expiry_days = 90
  }
}

policy "iam-password-length" {
  source = "./policies/aws/iam/iam-password-length.sentinel"
  enforcement_level = "hard-mandatory"
  params = {
    password_length = 14
  }
}

policy "iam-password-lowercase" {
  source = "./policies/aws/iam/iam-password-lowercase.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "iam-password-numbers" {
  source = "./policies/aws/iam/iam-password-numbers.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "iam-password-reuse" {
  source = "./policies/aws/iam/iam-password-reuse.sentinel"
  enforcement_level = "hard-mandatory"
  params = {
    allowed_password_reuse_limit = 24
  }
}

policy "iam-password-symbols" {
  source = "./policies/aws/iam/iam-password-symbols.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "iam-password-uppercase" {
  source = "./policies/aws/iam/iam-password-uppercase.sentinel"
  enforcement_level = "hard-mandatory"
}