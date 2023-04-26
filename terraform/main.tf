module "platform" {
    source              = "./modules/platform"
    org                 = var.org
    project             = var.project
    region             = var.region
    environment         = var.environment
    domain_name         = var.domain_name
    domain_name_servers = var.domain_name_servers
    ntp_servers         = var.ntp_servers
    main_vpc            = var.main_vpc
    public_availability_zones = var.public_availability_zones
    workload_subnets    = var.workload_subnets
}