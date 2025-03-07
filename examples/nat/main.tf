/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# [START cloudnat_simple_create]
module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 0.4"
  project = var.project_id # Replace this with your project ID in quotes
  name    = "my-cloud-router"
  network = "default"
  region  = "us-central1"

  nats = [{
    name = "my-nat-gateway"
    enable_endpoint_independent_mapping = true,
    high_availability                   = true,
    icmp_idle_timeout_sec               = 30,
    min_ports_per_vm                    = var.min_ports_per_vm,
    max_ports_per_vm                    = var.max_ports_per_vm,
    nat_ip_allocate_option              = "AUTO_ONLY",
    source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES",
    tcp_established_idle_timeout_sec    = 1200,
    tcp_transitory_idle_timeout_sec     = 30,
    udp_idle_timeout_sec                = 30,
  }]
}
# [END cloudnat_simple_create]
