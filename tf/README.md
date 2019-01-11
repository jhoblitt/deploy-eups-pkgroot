# terraform-scipipe-publish

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_primary\_region | AWS region to launch servers. | string | `"us-east-1"` | no |
| aws\_zone\_id | route53 Hosted Zone ID to manage DNS records in. | string | n/a | yes |
| deploy\_name | Name of deployment. | string | `"scipipe-publish"` | no |
| domain\_name | DNS domain name to use when creating route53 records. | string | n/a | yes |
| env\_name | Name of deployment environment. | string | n/a | yes |
| google\_project | google cloud project ID | string | n/a | yes |
| pkgroot\_storage\_size | Size of gcloud persistent volume claim. E.g.: 200Gi or 1Ti | string | `"10Gi"` | no |
| tls\_crt\_path | wildcard tls certificate. | string | n/a | yes |
| tls\_dhparam\_path | wildcard tls private key. | string | n/a | yes |
| tls\_key\_path | wildcard tls private key. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| DOXYGEN\_FQDN |  |
| DOXYGEN\_PUSH\_AWS\_ACCESS\_KEY\_ID |  |
| DOXYGEN\_PUSH\_AWS\_SECRET\_ACCESS\_KEY |  |
| DOXYGEN\_PUSH\_USER |  |
| DOXYGEN\_S3\_BUCKET |  |
| EUPS\_BACKUP\_AWS\_ACCESS\_KEY\_ID |  |
| EUPS\_BACKUP\_AWS\_SECRET\_ACCESS\_KEY |  |
| EUPS\_BACKUP\_S3\_BUCKET |  |
| EUPS\_BACKUP\_USER |  |
| EUPS\_FQDN |  |
| EUPS\_PULL\_AWS\_ACCESS\_KEY\_ID |  |
| EUPS\_PULL\_AWS\_SECRET\_ACCESS\_KEY |  |
| EUPS\_PULL\_USER |  |
| EUPS\_PUSH\_AWS\_ACCESS\_KEY\_ID |  |
| EUPS\_PUSH\_AWS\_SECRET\_ACCESS\_KEY |  |
| EUPS\_PUSH\_USER |  |
| EUPS\_S3\_BUCKET |  |
| EUPS\_TAG\_ADMIN\_AWS\_ACCESS\_KEY\_ID |  |
| EUPS\_TAG\_ADMIN\_AWS\_SECRET\_ACCESS\_KEY |  |
| EUPS\_TAG\_ADMIN\_USER |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->