#####################################################################
##
##      Created 7/4/18 by ucdpadmin. for nginx
##
#####################################################################

variable "ssh-key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3FtdzXQvimKTdkSWG0VzC69DHkd10TP8LRWeiX8QIX3kPBjIrkSkurVu7gv1v7rHFDy2nk8rti9IhVGckrrjq85PycdVE5fFhEIfFGdiwjSWbE0I1RkKAtlN5I778KNe1BMsXsZFa/Y0/ewcIL59OE6sjrw95aGfYblAOPti10VG+5xGV7V5CnzH1q1Dbi+dHAf5cciPDMavix4ZIhoFrCxSg3tFHZtSkcmTl7WNk0GZv27nT+9DRsjKJQFWf5MK6nmht22ZJrsUdXO799bNq6j4agOY2lTu3+3pt1uEnPcrtvE7QTP6jqFV+NGrcc/6Ie2VOJEqrbwm137Bp8IIHEUJuudvczKwmEDxVz6R2ZvXhAP1q5Onj8aSB4tYdYjjhLZr+V2wBwE2QmjG0fIv5bAObn9piwRIsL0ntsKcv7AjNBud33yTRaNVVP/UbEbElQGMhJyXQqWtY3MQHNo05a5Uug1xZXMdeP89QGzjFJCQfKyjczNR7h/akj6Uo8C/LK5UVn38kWAc7NovMolK5rAT9Xaeur/g8R3K4GSrWP67pzvOrel/t0f2MewplD5zNapZ7ZHQn9pHcwWb9xzYiiJM03Yo7dPspKuTvpFVA7oxVQMCYdE8SXwvubsbcuxPltUaP/1AfM3ULb9ILsUyBdwIlvX03X3d9V+orUQ3g5Q=="
}

variable "ssh-label" {
  default = "ssh_key_scale_group"
}

variable "lb-connections" {
  default = 250
}

variable "datacenter" {
  default = "dal09"
}

variable "lb-dedicated" {
  default = false
}

variable "lb-servvice-group-port" {
  default = 80
}

variable "lb-servvice-group-routing-method" {
  default = "CONSISTENT_HASH_IP"
}

variable "lb-servvice-group-routing-type" {
  default = "HTTP"
}

variable "lb-servvice-group-routing-allocation" {
  default = 100
}

variable "auto-scale-name" {
  default = "sample-http-cluster"
}

variable "auto-scale-region" {
  default = "na-usa-central-1"
}

variable "auto-scale-cooldown" {
  default = 30
}

variable "auto-scale-minimum-member-count" {
  default = 1
}

variable "auto-scale-maximumm-member-count" {
  default = 10
}

variable "auto-scale-termination-policy" {
  default = "CLOSEST_TO_NEXT_CHARGE"
}

variable "auto-scale-lb-service-port" {
  default = 80
}

variable "auto-scale-lb-service-health-check-type" {
  default = "HTTP"
}

variable "vm-hostname" {
  default = "virtual-guest"
}

variable "vm-domain" {
  default = "example.com"
}

variable "vm-cores" {
  default = 1
}

variable "vm-memory" {
  default = 4096
}

variable "vm-os-reference-code" {
  default = "UBUNTU_14_64"
}

variable "vm-post-install-script-uri" {
  default = "https://raw.githubusercontent.com/hkantare/test/master/nginx.sh"
}

variable "scale-policy-name" {
  default = "scale-policy"
}

variable "scale-policy-type" {
  default = "ABSOLUTE"
}

variable "scale-policy-scale-amount" {
  default = 2
}

variable "scale-policy-cooldown" {
  default = 35
}

variable "ibm_sl_username" {
  default = ""
}

variable "ibm_sl_api_key" {
  default = ""
}

variable "ibm_bx_api_key" {
  type = "string"
  description = "Ibm Bx Api Key"
}